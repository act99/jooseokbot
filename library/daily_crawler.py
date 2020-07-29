# -*- coding: utf-8 -*-


from library.daily_craw_config import *


class daily_crawler():
    def __init__(self, db_name, daily_craw_db_name, daily_buy_list_db_name):
        self.cc = daily_craw_config(db_name, daily_craw_db_name, daily_buy_list_db_name)

    def crawling_data(self):
        self.cc.crawling_data(0, self.cc.total_stock_count)
