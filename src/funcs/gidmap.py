import mygene
import pandas as pd

class GeneIDMap:
    mg = mygene.MyGeneInfo()
    def __init__(self, not_found_val = -1, log_errors=True, check_agreement=False, species='human'):
        self._not_found_val = not_found_val
        self.log_errors = log_errors
        if log_errors:
            self.reset_errorlog()
        self._check_agreement = check_agreement
        self._species = species
        self._sources = {'mygene':None}
        self._source_priority = ['mygene']

    def entrez2symb(self, gene_id):
        return self.convert(gene_id, 'entrez', 'symbol')
    def symb2entrez(self, gene_id):
        return self.convert(gene_id, 'symbol', 'entrez')
    def entrez2ensembl(self, gene_id):
        return self.convert(gene_id, 'entrez', 'ensembl')
    def ensembl2entrez(self, gene_id):
        return self.convert(gene_id, 'ensembl', 'entrez')
    def symb2ensembl(self, gene_id):
        return self.convert(gene_id, 'symbol', 'ensembl')
    def ensembl2symb(self, gene_id):
        return self.convert(gene_id, 'ensembl', 'symbol')
    def entrez2ensembl_p(self, gene_id):
        return self.convert(gene_id, 'entrez', 'ensembl_p')
    def ensembl_p2entrez(self, gene_id):
        return self.convert(gene_id, 'ensembl_p', 'entrez')

    def convert(self, gene_id, src_id=None, dest_id=None):
        if self._check_agreement and not self.log_errors:
            raise ValueError('check_agreement option can be activated only when logging errors (log_errors in constructor)')
        if hasattr(gene_id, '__len__') and (not isinstance(gene_id, str)):
            return list(map(lambda x: self.convert(x, src_id, dest_id), gene_id))
        else:
            dest_gene_id = {}
            best_gene_id = self._not_found_val
            for source_id in self._source_priority:
                dest_gene_id[source_id] = self.convert_from_source(gene_id, source_id, src_id, dest_id)
                if dest_gene_id[source_id] != self._not_found_val:
                    if best_gene_id == self._not_found_val:
                        best_gene_id = dest_gene_id[source_id]
                    if not self._check_agreement:
                        return dest_gene_id[source_id]
            if self._check_agreement:
                # triggers if there are at least two *different* responses that are != NOT_FOUND
                found_gids = {source_id:gid for source_id,gid in set(dest_gene_id.items()) if gid != self._not_found_val}
                if len(set(found_gids.values())) > 1:
                    all_resp = '|'.join([source_id + ':' + str(dest_gene_id[source_id]) for source_id in self._source_priority])
                    n_hits = len(found_gids)
                    self.errors = self.errors.append({'Gene_ID': gene_id, 'Source': '|'.join(self._source_priority), 'Src_ID': src_id, 'Dest_ID': dest_id, 'Err_type': 'DISAGREE', 'N_hits': n_hits, 'Resp_values': all_resp}, ignore_index=True)
            return best_gene_id

    def convert_from_source(self, gene_id, source_id, src_id, dest_id):
        if hasattr(gene_id, '__len__') and (not isinstance(gene_id, str)):
            return list(map(lambda x: self.convert_from_source(x, source_id, src_id, dest_id), gene_id))
        else:
            if source_id in self._sources.keys():
                if source_id == 'mygene':
                    gene_id_dest, error = convert_from_mygene(gene_id, src_id, dest_id, species=self._species, not_found_val=self._not_found_val)
                    if self.log_errors and len(error) > 0:
                        self.errors = self.errors.append(error, ignore_index=True)
                    return self._formatter(gene_id_dest, dest_id)
                else:
                    if self._infer_source_type(source_id) == 'table':
                        return self._convert_from_table(gene_id, source_id, src_id, dest_id)
                    else:
                        return self._convert_from_dict(gene_id, source_id, src_id, dest_id)
            else:
                raise ValueError('Incorrect source selected, possible values are: ' + ','.join(list(self._sources.keys())))

    ''' Convert gene ID according to lookup table '''
    def _convert_from_table(self, gene_id, source_id, src_id, dest_id):
        table_df = self._sources[source_id]
        if src_id in table_df.columns.tolist() and dest_id in table_df.columns.tolist():
            matches = table_df[(table_df[src_id] == gene_id) & ~pd.isnull(table_df[dest_id])]
            if len(matches) > 0:
                if len(matches) > 1:
                    all_resp = '|'.join([str(g[src_id]) + ':' + str(g[dest_id]) for _, g in matches.iterrows()])
                    if self.log_errors:
                        self.errors = self.errors.append({'Gene_ID': gene_id, 'Source': source_id, 'Src_ID': src_id, 'Dest_ID': dest_id, 'Err_type': 'MULTI_MAP', 'N_hits': len(matches), 'Resp_values': all_resp}, ignore_index=True)
                return self._formatter(matches.iloc[0][dest_id], dest_id)
            else:
                if self.log_errors:
                    self.errors = self.errors.append({'Gene_ID': gene_id, 'Source': source_id, 'Src_ID': src_id, 'Dest_ID': dest_id, 'Err_type': 'NOT_FOUND', 'N_hits': len(matches), 'Resp_values': self._not_found_val}, ignore_index=True)
                return self._not_found_val
        else:
            if self.log_errors:
                self.errors = self.errors.append({'Gene_ID': gene_id, 'Source': source_id, 'Src_ID': src_id, 'Dest_ID': dest_id, 'Err_type': 'NO_ID_INFO', 'N_hits': 0, 'Resp_values': self._not_found_val}, ignore_index=True)
            return self._not_found_val

    '''
        Convert gene ID according to lookup dictionary of the form datadict[src_id][dest_id][gene_id]
        Example:
            datadict['symbol']['entrez']['IL13']
    '''
    def _convert_from_dict(self, gene_id, source_id, src_id, dest_id):
        if src_id in self._sources[source_id] and dest_id in self._sources[source_id][src_id]:
            if gene_id in self._sources[source_id][src_id][dest_id]:
                dest_gene_id = self._sources[source_id][src_id][dest_id][gene_id]
                return self._formatter(dest_gene_id, dest_id)
            else:
                if self.log_errors:
                    self.errors = self.errors.append({'Gene_ID': gene_id, 'Source': source_id, 'Src_ID': src_id, 'Dest_ID': dest_id, 'Err_type': 'NOT_FOUND', 'N_hits': 0, 'Resp_values': self._not_found_val}, ignore_index=True)
                return self._not_found_val
        else:
            if self.log_errors:
                self.errors = self.errors.append(
                    {'Gene_ID': gene_id, 'Source': source_id, 'Src_ID': src_id, 'Dest_ID': dest_id,
                     'Err_type': 'NO_ID_INFO', 'N_hits': 0, 'Resp_values': self._not_found_val}, ignore_index=True)
            return self._not_found_val


    ''' 
        Load lookup table (.tsv). 
        source_id is a unique identifier for the source
        col2idtype_map is a dictionary mapping each column (key) to the corresponding gene ID (value)
        Possible gene IDs: 'entrez', 'symbol', 'ensembl'
    '''
    def load_table(self, source_id, table_path, col2idtype_map=None, top_priority=True):
        if col2idtype_map is None: col2idtype_map = {'entrez':'entrez','symbol':'symbol','ensembl':'ensembl'}
        tabledata = pd.read_csv(table_path, sep='\t', usecols=list(col2idtype_map.keys())).rename(columns=col2idtype_map)
        self._add_source(source_id, tabledata, top_priority)

    '''
        Load source from dictionary with format datadict[src_id][dest_id][gene_id]
        Example:
            datadict['symbol']['entrez']['IL13']
    '''
    def load_dict(self, source_id, dict_path, top_priority=True):
        import pickle
        with open(dict_path, "rb") as f:
            datadict = pickle.load(f)
        self._add_source(source_id, datadict, top_priority)

    ''' Load Biomart data file '''
    def load_biomart(self, biomart_path=None):
        if biomart_path is None:
            import machine_specific as ms
            biomart_path = ms.BIOMART_GENE_DATA
        self.load_table('biomart', biomart_path, col2idtype_map={'Approved symbol':'symbol','NCBI Gene ID':'entrez','Ensembl gene ID':'ensembl'})

    ''' returns 'dict' if dictionary, else 'table' if table '''
    def _infer_source_type(self, source_id):
        if isinstance(self._sources[source_id], dict):
            return "dict"
        elif isinstance(self._sources[source_id], pd.DataFrame):
            return "table"
        else:
            return ValueError('Source type not understood (something is wrong)')

    def _add_source(self, source_id, source_data, top_priority=True):
        self._sources[source_id] = source_data
        if top_priority:
            self._source_priority.insert(0, source_id)
        else:
            self._source_priority.append(source_id)
        return self

    def _formatter(self, gid, gid_type):
        if gid_type == 'entrez':
            gid = int(gid)
        return gid

    def get_sources(self):
        self._sources

    def set_source_priority(self, source_priority):
        self._source_priority = source_priority
        return self

    def get_source_priority(self):
        return self._source_priority

    # Enable or disable checking the agreement between sources
    def enable_agreement_check(self):
        self._check_agreement = True
    def disable_agreement_check(self):
        self._check_agreement = False
    def reset_errorlog(self):
        self.errors = pd.DataFrame([],columns=['Gene_ID', 'Source','Src_ID','Dest_ID','Err_type','N_hits','Resp_values'])
    def errorlog(self):
        return self.errors
    def get_failed_queries(self):
        # number of gene names that have not been translated in any source
        grouped = self.errors.groupby('Gene_ID').apply(lambda x: len(x.Source.unique()))
        return grouped[grouped == len(self._sources)].index.tolist()


def convert_from_mygene(gene_id, src_id, dest_id, species='human', not_found_val=-1):
    type2field = {'symbol': 'symbol', 'entrez': 'entrezgene', 'ensembl': 'ensembl', 'ensembl_p':'ensembl.protein', 'ensembl_t':'ensembl.transcript'}
    type2field_req = {'symbol': 'symbol', 'entrez': 'entrezgene', 'ensembl': 'ensembl.gene', 'ensembl_p':'ensembl.protein', 'ensembl_t':'ensembl.transcript'}
    src_id_loc = type2field[src_id]
    dest_id_loc = type2field[dest_id]
    ens_ids = {'ensembl': 'gene', 'ensembl_p': 'protein', 'ensembl_t': 'transcript'}
    query = GeneIDMap.mg.query(type2field_req[src_id] + ':' + str(gene_id), fields=','.join([type2field_req[src_id],type2field_req[dest_id]]),
                               #symbol='symbol' in [src_id_loc, dest_id_loc],
                               #entrezgene='entrezgene' in [src_id_loc, dest_id_loc],
                               entrezonly='entrezgene' in [src_id_loc, dest_id_loc],
                               #ensembl='ensembl' in [src_id_loc, dest_id_loc],
                               ensemblonly=src_id in ens_ids or dest_id in ens_ids,
                               species=species)
    errors = []
    if query['total'] > 0:
        matches = query['hits']

        if src_id in ens_ids:
            all_ids = [elem for elem_list in mygene.alwayslist(matches[0]['ensembl']) for elem in
                       mygene.alwayslist(elem_list[ens_ids[src_id]])]
            if gene_id not in all_ids:
                    all_resp = gene_id + ':' + ','.join(all_ids)
                    errors.append({'Gene_ID': gene_id, 'Source': 'mygene', 'Src_ID': src_id, 'Dest_ID': dest_id,
                                   'Err_type': 'SRC_ID_MISMATCH',
                                   'N_hits': query['total'], 'Resp_values': all_resp})
        else:
            matches_src_id = [matches[i][src_id_loc] for i in range(len(matches))]
            if dest_id in ens_ids:
                matches_dest_id = [[elem for elem_list in mygene.alwayslist(matches[i]['ensembl']) if ens_ids[dest_id] in elem_list for elem in
                       mygene.alwayslist(elem_list[ens_ids[dest_id]])] for i in range(len(matches))]
            else:
                matches_dest_id = [matches[i][dest_id_loc] for i in range(len(matches))]
            # If multiple hits and first hit doesn't return same value as queried
            if len(matches) > 1 and str(matches_src_id[0]).lower() != str(gene_id).lower():
                all_resp = '|'.join(
                    [str(g_src) + ':' + str(g_dest) for g_src, g_dest in zip(matches_src_id, matches_dest_id)])
                errors.append({'Gene_ID': gene_id, 'Source': 'mygene', 'Src_ID': src_id, 'Dest_ID': dest_id,
                               'Err_type': 'MULTI_MAP',
                               'N_hits': query['total'], 'Resp_values': all_resp})
        if dest_id in ens_ids:
            if ens_ids[dest_id] not in mygene.alwayslist(matches[0]['ensembl'])[0]:
                errors = {'Gene_ID': gene_id, 'Source': 'mygene', 'Src_ID': src_id, 'Dest_ID': dest_id,
                          'Err_type': 'NOT_FOUND',
                          'N_hits': query['total'], 'Resp_values': not_found_val}
                return not_found_val, errors
            else:
                all_ids = [elem for elem_list in mygene.alwayslist(matches[0]['ensembl']) for elem in
                       mygene.alwayslist(elem_list[ens_ids[dest_id]])]
            if len(all_ids) > 1:
                all_resp = str(gene_id) + ':' + ','.join(all_ids)
                errors.append({'Gene_ID': gene_id, 'Source': 'mygene', 'Src_ID': src_id, 'Dest_ID': dest_id,
                               'Err_type': 'MULTI_MAP',
                               'N_hits': query['total'], 'Resp_values': all_resp})
                return all_ids, errors
            else:
                return all_ids[0], errors
        elif dest_id == 'entrez':
            return int(matches[0][dest_id_loc]), errors
        else:
            return matches[0][dest_id_loc], errors
    else:
        errors = {'Gene_ID': gene_id, 'Source': 'mygene', 'Src_ID': src_id, 'Dest_ID': dest_id, 'Err_type': 'NOT_FOUND',
             'N_hits': query['total'], 'Resp_values': not_found_val}
        return not_found_val, errors

if __name__ == '__main__':

    print(convert_from_mygene('ENSP00000243067', src_id='ensembl_p',dest_id='ensembl_t'))

    #print(convert_from_mygene(1017, src_id='entrez',dest_id='ensembl_p'))

    #print(GeneIDMap.mg.query([1017, '1018','ENSG00000148795','IL33'], fields="entrezgene,uniprot,symbol", symbol=True))