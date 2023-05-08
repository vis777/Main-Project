import numpy as np
import pymysql

from werkzeug.utils import secure_filename
import re, math

from src.dbconnection import *


def cb(qus):
    WORD = re.compile(r'\w+')

    from collections import Counter
    def text_to_vector(text):
        words = WORD.findall(text)
        return Counter(words)

    def get_cosine(vec1, vec2):
        intersection = set(vec1.keys()) & set(vec2.keys())
        numerator = sum([vec1[x] * vec2[x] for x in intersection])
        sum1 = sum([vec1[x] ** 2 for x in vec1.keys()])
        sum2 = sum([vec2[x] ** 2 for x in vec2.keys()])
        denominator = math.sqrt(sum1) * math.sqrt(sum2)

        if not denominator:
            return 0.0
        else:
            return float(numerator) / denominator

    vector1 = text_to_vector(qus)
    qry="select Question,Dataid from dataset"
    ss1 =selectall(qry)

    print("s--" ,ss1)
    res = []
    for d in ss1:
        vector2 = text_to_vector(str(d['Question']))
        cosine = get_cosine(vector1, vector2)
        # print("cosine",cosine)

        res.append(cosine)

    print("res---" ,res)

    ss = 0
    cnt = -1
    i = 0
    for s in res:
        if s > 0.3:
            if ss <= float(s):
                cnt = i
                ss = s
        i = i + 1

    print("ss", ss)
    print("cnt", cnt)
    if cnt!=-1:
        q="select * from dataset where Dataid=%s"
        aa = selectone(q,str(ss1[cnt]['Dataid']))
        print(aa)
        if aa is None:
            return "Sorry, I can not understand the question"
        else:
            return aa['Answer']
    else:
        return "Sorry, I can not understand the question"


# cb("How are you?")