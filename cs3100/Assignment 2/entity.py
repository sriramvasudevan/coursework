from math import ceil

class Entity(object):
    '''
    Entity class - Enters queue, makes requests from Counter objects, exits via another queue
    Inherit to extend.
    '''
    number = 0 # Class attribute to keep track of IDs
    def __init__(self, max_goods_desired, desire_dist, **kwargs):
        '''
        Init function.
        Override to add custom fields.

        Parameters:
        max_goods_desired = maximum no. of goods allowed for a counter
        desire_dist = passed probability distribution
        **kwargs = keyword arguments, to allow parameters to be passed to the distribution
        '''
        Entity.number += 1
        self.id = Entity.number

        self.goods_desired = ceil(max_goods_desired*desire_dist(**kwargs))
        self.curr_goods = 0

        # Wait times
        self.entry_wait = 0
        self.exit_wait = 0
