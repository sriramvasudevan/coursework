from math import ceil

class Entity(object):
    number = 0
    def __init__(self, max_goods_desired, desire_dist, **kwargs):
        Entity.number += 1
        self.id = Entity.number
        self.goods_desired = ceil(max_goods_desired*desire_dist(**kwargs))
        self.curr_goods = 0
        self.at = None
        self.entry_wait = 0
        self.exit_wait = 0
