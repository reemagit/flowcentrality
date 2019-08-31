GOA species-specific files README
---------------------------------

1.  Contents
------------

1. Contents
2. Introduction
3. Data types
4. List of files and their included data types
5. Contacts
6. Copyright Notice


2.  Introduction
----------------

The GO Annotation project at the European Bioinformatics Institute aims to provide assignments of gene products to the Gene Ontology (GO) resource. The goal of the Gene Ontology Consortium is to produce a dynamic controlled vocabulary that can be applied to all organisms, even while the knowledge of the gene product roles in cells is still accumulating and changing. In the GOA project, this vocabulary is applied to all proteins described in the UniProt (Swiss-Prot and TrEMBL) Knowledgebase, and to RNAs and macromolecular complexes, identified by RNAcentral and Complex Portal identifiers, respectively.

For full information on the GOA project, please go to: http://www.ebi.ac.uk/GOA

This readme describes the formats and contents of the UniProt species-specific files. The species-specific annotation sets are created using the UniProtKB Reference Proteome sets: these sets provide one protein per gene. The protein accessions included in these files are the protein sequences annotated in Swiss-Prot or the longest TrEMBL transcript if there is no Swiss-Prot record.

The species-specific annotation sets have been filtered in order to reduce redundancy. This filtering process consists of removing electronic annotations to less-specific GO terms where an annotation (either manual or electronic) to a more specific term exists. Additionally, if there are multiple manual annotations to the same GO term, then preference is given to those with experimental evidence codes.
The current set of species that we provide these files for is listed on our project website.


3. Data types
-------------

a) DB
Database from which annotated entity has been taken.
Example: UniProtKB

b) DB_Object_ID
A unique identifier in the database for the item being annotated.
Example: O00165

c) DB_Object_Symbol
A unique and valid symbol (gene name) that corresponds to the DB_Object_ID.
An officially approved gene symbol will be used in this field when available.
Alternatively, other gene symbols or locus names are applied.
If no symbols are available, the DB_Object_ID will be used.
Examples: G6PC
CYB561
MGCQ309F3

d) Qualifier
In the GAF format, this column is used for flags that modify the interpretation of an annotation. The values that may be present in this field are: NOT, colocalizes_with, contributes_to, NOT|contributes_to, NOT|colocalizes_with.

In the GPAD format, this column is used for explicit relations between the entity and the GO term. An entry in this column is required in this file format.
The default relations are part_of (for Cellular Component), involved_in (for Biological Process) or enables (for Molecular Function). Other values that may be present in this field are: colocalizes_with and contributes_to. Any of these relations can be additionally qualified with 'NOT'.
Example: NOT|involved_in

e) GO ID
The GO identifier for the term attributed to the DB_Object_ID.
Example: GO:0005634

f) DB:Reference
A single reference cited to support an annotation. Where an annotation cannot reference a paper, this field will contain a GO_REF identifier. See
http://www.geneontology.org/doc/GO.references for an explanation of the reference types used.
Examples: PMID:9058808
DOI:10.1046/j.1469-8137.2001.00150.x
GO_REF:0000002
GO_REF:0000020

g) Evidence Code
In the GAF format, this column is used for one of the evidence codes supplied by the GO Consortium (http://www.geneontology.org/GO.evidence.shtml).
Example: IDA

In the GPAD file format, this column is used for identifiers from the Evidence Code Ontology (http://evidenceontology.googlecode.com/svn/trunk/eco.obo)
Example: ECO:0000320

h) With (or) From
Additional identifier(s) to support annotations using certain evidence codes (including IEA, IPI, IGI, IMP, IC and ISS evidences).
Examples: UniProtKB:O00341
InterPro:IPROO1878
RGD:123456
CHEBI:12345
Ensembl:ENSG00000136141
GO:0000001
EC:3.1.22.1

i) Aspect
One of the three ontologies, corresponding to the GO identifier applied.
P (biological process), F (molecular function) or C (cellular component).
Example: P

j) DB_Object_Name
The full entity name will be present here, if available from the resource that supplies the object identifier. If a name cannot be added, this field will be left empty.
Examples: Glucose-6-phosphatase
Cellular tumor antigen p53
Coatomer subunit beta

k)  DB_Object_Synonym
Alternative gene symbol(s) or identifiers are provided pipe-separated, if available from from the supplying resource. If none of these identifiers
have been supplied, the field will be left empty.
Examples:
RNF20|BRE1A|BRE1A_BOVIN
MMP-16

l) DB_Object_Type
The kind of entity being annotated, which for the files based on UniProt Complete Proteomes can be either 'protein', 'complex' or 'RNA' and for the files based on UniProt Reference Proteomes is 'protein'.

m) Taxon
Identifier for the species being annotated or the gene product being defined. In the GAF format, an interacting taxon ID (see n) below) may be included in this column using a pipe to separate it from the primary taxon ID.
Example: taxon:9606

n) Interacting_Taxon_ID
This field is only present in the GPAD format files and has been separated from the dual taxon ID format allowed in the gene association format files.
This taxon ID should inform on the other organism involved in a multi-species interaction. An interacting taxon identifier can only be used in conjunction with terms that have the biological process term 'GO:0051704; multi-organism process' or the cellular component term 'GO:0044215; other organism' as an ancestor. This taxon ID should inform on the other organism involved in the interaction. For further information please see: http://geneontology.org/page/go-annotation-conventions#interactions
Example: taxon:9606

o) Date
The date of last annotation update in the format 'YYYYMMDD'
Example: 20050101

p) Assigned_By
Attribution for the source of the annotation.
Examples: UniProtKB, AgBase

q) Annotation_Extension
Contains cross references to other ontologies/databases that can be used to qualify or enhance the GO term applied in the annotation.
The cross-reference is prefaced by an appropriate GO relationship; references to multiple ontologies can be entered as linked (comma separated) or independent (pipe separated) statements.
Examples: part_of(CL:0000084)
occurs_in(GO:0009536)
has_input(CHEBI:15422)
has_output(CHEBI:16761)
has_regulation_target(UniProtKB:P12345)|has_regulation_target(UniProtKB:P54321)
part_of(CL:0000017),part_of(MA:0000415)

r) Gene_Product_Form_ID
The unique identifier of a specific spliceform of the DB_Object_ID.
Example: O43526-2

s) Annotation_Properties
This column is reserved for internal use; it will not be populated in public files

t) Parent_Object_ID
This field supplies the relationship between the DB_Object_ID and the canonical UniProtKB accession number or Complex Portal macromolecular complex identifier, where the DB_Object_ID is an isoform identifier or subunit of a complex.
Examples:
UniProtKB:P21678
ComplexPortal:CP-2342163

u) DB_Xref(s)
This field supplies alternative identifiers (cross-references) for the DB_Object_ID.
This field will not be populated in the GOA files.

v) Gene_Product_Properties
This field can be populated with information concerning the DB_Object_ID. The syntax of the field will conform to a pipe-separated list of "property_name=property_value". There is a controlled vocabulary for the property names. The GOA files will use this field to indicate:

i) DB_Subset
The database subset from which the entity being described has been taken. This information will only be supplied for UniProtKB, where this field will be one of Swiss-Prot or TrEMBL.
Examples:
db_subset=Swiss-Prot
db_subset=TrEMBL

ii) Annotation_Target_Set
A description of the list in which the entity has been included for prioritized annotation.
Examples:
target_set=BHF-UCL
target_set=KRUK
target_set=ReferenceGenome

iii) GO_Annotation_Complete
The date when a curator has indicated that the entity's GO annotation record was comprehensively curated.
Example: go_annotation_complete=20080131


4.  List of files and their included data types
-----------------------------------------------

All annotation sets are provided in both GAF2.1 (http://geneontology.org/page/go-annotation-file-gaf-format-21) and GPAD1.1 (http://geneontology.org/page/gene-product-association-data-gpad-format) format.

GAF2.1 files have the suffix .gaf and contain the following columns:

	Column  Contents
	1       DB
	2       DB_Object_ID
	3       DB_Object_Symbol
	4       Qualifier
	5       GO_ID
	6       DB:Reference
	7       Evidence Code
	8       With (or) From
	9       Aspect
	10      DB_Object_Name
	11      DB_Object_Synonym
	12      DB_Object_Type
	13      Taxon and Interacting taxon
	14      Date
	15      Assigned_By
	16      Annotation_Extension
	17      Gene_Product_Form_ID

GPAD1.1 files have the suffix .gpa and contain the following columns:

	Column  Contents
	1       DB
	2       DB_Object_ID
	3       Qualifier
	4       GO_ID
	5       DB:Reference
	6       Evidence Code
	7       With (or) From
	8       Interacting_Taxon_ID
	9       Date
	10      Assigned_By
	11      Annotation_Extension
	12      Annotation_Properties

All gene product metadata files are supplied in GPI1.2 format, and have the suffix .gpi; they contain the following columns:

	Column  Contents
	1       DB
	2       DB_Object_ID
	3       DB_Object_Symbol
	4       DB_Object_Name
	5       DB_Object_Synonym
	6       DB_Object_Type
	7       Taxon
	8       Parent_Object_ID
	9       DB_Xref(s)
	10      Gene_Product_Properties

All species-specific files are gzipped to reduce the size and are located at ftp://ftp.ebi.ac.uk/pub/databases/GO/goa/.
The files currently produced are:

i) goa_<species>.[gaf|gpa]
This set contains all GO annotations for canonical accessions from the UniProt reference proteome for the species, which provides one protein per gene. The reference proteome comprises the protein sequences annotated in Swiss-Prot or the longest TrEMBL transcript if there is no Swiss-Prot record.

ii) goa_<species>_isoform.[gaf|gpa]
This set contains all GO annotations for isoforms of canonical accessions from the UniProt reference proteome for the species, which provides one protein per gene. The reference proteome comprises the protein sequences annotated in Swiss-Prot or the longest TrEMBL transcript if there is no Swiss-Prot record.

iii) goa_<species>_complex.[gaf|gpa]
This set contains all GO annotations for macromolecular complexes (identified by Complex Portal identifiers) for the species.

iv) goa_<species>_rna.[gaf|gpa]
This set contains all GO annotations and information for RNAs (identified by RNAcentral identifiers) for the species.

v) goa_<species>.gpi
This file contains metadata (name, symbol, synonyms, etc) for all canonical accessions from the UniProt reference proteome for the species, whether they have GO annotations or not.

vi) goa_<species>_isoform.gpi
This file contains metadata (name, symbol, synonyms, etc) for all isoforms of canonical accessions from the UniProt reference proteome for the species, whether they have GO annotations or not.

vi) goa_<species>_complex.gpi
This file contains metadata (name, symbol, synonyms, etc) for all macromolecular complexes (identified by Complex Portal identifiers) for the species, whether they have GO annotations or not.

viii) goa_<species>_rna.gpi
This file contains metadata (name, symbol, synonyms, etc) for all RNAs (identified by RNAcentral identifiers) for the species, whether they have GO annotations or not.


5. Contacts
-----------

Please direct any questions to goa@ebi.ac.uk  We welcome any feedback.


6. Copyright Notice
-------------------

GOA - GO Annotation
Copyright 2018 (C) The European Bioinformatics Institute.
This README and the accompanying databases may be copied and
redistributed freely, without advance permission, provided that this
copyright statement is reproduced with each copy.