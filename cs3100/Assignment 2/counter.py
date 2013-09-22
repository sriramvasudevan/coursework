from math import ceil

class Counter(object):
    number = 0
    def __init__(self, max_goods, goods_dist, **kwargs):
        Counter.number += 1
        self.id = Counter.number
        self.goods = ceil(max_goods*goods_dist(**kwargs))
        self.engaged = None
        self.empty = (self.goods==0)
