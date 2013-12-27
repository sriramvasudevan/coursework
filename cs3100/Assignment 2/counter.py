from math import ceil

class Counter(object):
    '''
    The Counter class that services requests from Entity objects
    Custom Counter classes can inherit this class and override it
    as necessary.
    '''

    number = 0 # Class attribute to keep track of IDs

    def __init__(self, max_goods, goods_dist, **kwargs):
        '''
        Initialisation function.
        Override to add custom fields.
        
        Parameters:
        max_goods = maximum no. of goods allowed for a counter
        goods_dist = passed probability distribution
        **kwargs = keyword arguments, to allow parameters to be passed to the distribution
        '''
        Counter.number += 1
        self.id = Counter.number

        # Uses the passed distribution to compute the value
        self.goods = ceil(max_goods*goods_dist(**kwargs))
        # Is the counter engaged?
        self.engaged = None
        # Is the counter empty?
        self.empty = (self.goods==0)
