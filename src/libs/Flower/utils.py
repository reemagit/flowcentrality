from tqdm.autonotebook import tqdm
from concurrent.futures import ProcessPoolExecutor, as_completed

def load_nodeset_file(path, sep=' ', as_column=False):
    if as_column:
        import pandas as pd
        return pd.read_csv(path,header=None)[0].tolist()
    else:
        with open(path, 'r') as f:
            rows = [row.split(sep) for row in f.read().splitlines()]
            if len(rows) == 1:
                return rows[0]
            else:
                return rows

class GIDMapper:
    def __init__(self, nodelist):
        self.nodelist = nodelist
        self._gid2id_dict = {gid: i for i, gid in enumerate(nodelist)}
        self._dtype = type(nodelist[0])

    def id2gid(self, ids):
        if isinstance(ids, int):
            return self.nodelist[ids]
        else: # if it is a list of ids
            return [int(self.nodelist[i]) for i in ids]

    def gid2id(self, gids):
        if isinstance(gids, self._dtype):
            return self._gid2id_dict[gids]
        else: # if it is a list of gids
            return [self._gid2id_dict[gid] for gid in gids]

def parallel_process(function, array, n_jobs=None, use_kwargs=False, front_num=0, leave=True, mute=False):
    """
        A parallel version of the map function with a progress bar.

        Args:
            array (array-like): An array to iterate over.
            function (function): A python function to apply to the elements of array
            n_jobs (int, default=16): The number of cores to use
            use_kwargs (boolean, default=False): Whether to consider the elements of array as dictionaries of
                keyword arguments to function
            front_num (int, default=3): The number of iterations to run serially before kicking off the parallel job.
                Useful for catching bugs
        Returns:
            [function(array[0]), function(array[1]), ...]
    """
    bar_func = tqdm
    if mute:
        def identity(x, *args, **kwargs):
            return x
        bar_func = identity

    front = []
    #We run the first few iterations serially to catch bugs
    if front_num > 0:
        front = [function(**a) if use_kwargs else function(a) for a in array[:front_num]]
    #If we set n_jobs to 1, just run a list comprehension. This is useful for benchmarking and debugging.
    if n_jobs==1:
        return front + [function(**a) if use_kwargs else function(a) for a in tqdm(array[front_num:])]
    #Assemble the workers
    with ProcessPoolExecutor(max_workers=n_jobs) as pool:
        #Pass the elements of array into function
        if use_kwargs:
            futures = [pool.submit(function, **a) for a in array[front_num:]]
        else:
            futures = [pool.submit(function, a) for a in array[front_num:]]
        kwargs = {
            'total': len(futures),
            'unit': 'it',
            'unit_scale': True,
            'leave': leave
        }
        #Print out the progress as tasks complete

        for f in bar_func(as_completed(futures), **kwargs):
            pass
    out = []
    #Get the results from the futures.
    for i, future in bar_func(enumerate(futures)):
        try:
            out.append(future.result())
        except Exception as e:
            out.append(e)
    return front + out