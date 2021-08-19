#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pymongo
import urllib
from creds import db_password, db_username

class Database(object):

    def __init__(self):
        self.dbname = 'customer'
        self.username = db_username
        self.password = db_password
        self.db_conn = None
        self.db = None

    def __enter__(self):
        # This ensure, whenever an object is created using "with"
        # this magic method is called, where you can create the connection.
        print(f'connecting to db ...')
        connection_string = "mongodb+srv://{db_username}:{password}@chronicdisease.gudvk.mongodb.net/{dbname}?retryWrites=true&w=majority"
        connection_string = connection_string.format(
                                                    db_username=self.username,
                                                    password=urllib.parse.quote(self.password),
                                                    dbname=self.dbname
                                                    )
        print(connection_string)

        try:
            self.db_conn = pymongo.MongoClient(connection_string, serverSelectionTimeoutMS=2) # 2 millisecond max server delay
            self.db_conn.server_info() # force connection on a request as the
                                        # connect=True parameter of MongoClient seems
                                        # to be useless here
        except pymongo.errors.ServerSelectionTimeoutError as err:
            print(err)
            exit(0) # exit process?

        self.db = self.db_conn[self.dbname]
        return self

    def __exit__(self, exception_type, exception_val, trace):
        # once the with block is over, the __exit__ method would be called
        # with that, you close the connnection
        try:
            # dont need to close the db?
            self.db_conn.close() # close client
        except AttributeError:
            print('Not closable.')
            return True # exception handled successfully

    def insert_chat(self, lj):
        self.db['chats'].insert_one(lj)