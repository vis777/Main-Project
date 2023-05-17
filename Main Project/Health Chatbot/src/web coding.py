from email.mime.text import MIMEText

import os
from flask import *
from src.dbconnection import *
app=Flask(__name__)
from src.myknn import *
import smtplib
from email.mime.text import MIMEText
from flask_mail import Mail

app.secret_key="8989"
import functools

def login_required(func):
    @functools.wraps(func)
    def secure_function():
        if "lid" not in session:
            return render_template('index.html')
        return func()

    return secure_function


@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')

mail=Mail(app)
# SECRET_KEY=os.environ.get('SECRET_KEY')
# SQLALCHEMY_DATABASE_URI=os.environ.get('SQLALCHEMY_DATABASE_URI')
#
# app.config['MAIL_SERVER']='smtp.googlemail.com'
# app.config['MAIL_PORT'] = 465
# app.config['MAIL_USERNAME'] = 'vishnuforgot@gmail.com'
# app.config['MAIL_PASSWORD'] = 'yjttsvulssirvbwp'
# # app.config['MAIL_USE_TLS'] = False
# app.config['MAIL_USE_SSL'] = True


@app.route('/')
def log():
    return  render_template('index.html')




@app.route('/login',methods=['post'])
def login():
    username=request.form["Username"]
    password=request.form["Password"]
    query="Select * from login where username = %s and password = %s"
    val=(username,password)
    res=selectone(query,val)
    if res is None:
        return '''<script>alert('invalid');window.location="/"</script>'''
    elif res['type']=='admin':
        session['lid'] = res['lid']
        return '''<script>alert('success');window.location="/home"</script>'''
    elif res['type']=='user':
        session['lid'] = res['lid']
        return '''<script>alert('success');window.location="/user_home"</script>'''
    elif res['type'] == 'expert':
        session['lid']=res['lid']
        return '''<script>alert('success');window.location="/expert_home"</script>'''
    else:
     return '''<script>alert('invalid');window.location="/"</script>'''






@app.route('/forgotpassword',methods=['post','get'])
def forgotpassword():
    return render_template("forgotpassword.html")


@app.route('/fgpaw',methods=['get','post'])
def fgpaw():
    email=request.form['textfield']
    qry="SELECT `login`.`password` FROM `login` JOIN `user` ON `login`.`lid`=`user`.`lid` where user.Email=%s"
    s1 = selectone(qry,email)
    if s1 is None:
       return '''<script>alert("invalid email");window.location='/'</script>'''
    else:
        pwd=s1['password']
        # res=selectone("select * from login where lid=%s",str(lid))
        # pswd
        try:
            gmail = smtplib.SMTP('smtp.gmail.com', 587)
            gmail.ehlo()
            gmail.starttls()
            gmail.login('vishnuforgot@gmail.com','yjttsvulssirvbwp')
        except Exception as e:
            print("Couldn't setup email!!" + str(e))
        msg = MIMEText("your password is : " + str(pwd))
        print(msg)
        msg['Subject'] = 'forgot password Info'
        msg['To'] = email
        msg['From'] = 'vishnuforgot@gmail.com'
    try:
        gmail.send_message(msg)
    except Exception as e:
        print("COULDN'T SEND EMAIL", str(e))
    return '''<script>alert("successfully send!!"); window.location="/"</script>'''










@app.route('/addandmanageexprt')
@login_required
def addandmanageexprt():
    qry = "SELECT * FROM `expert`"
    res = selectall(qry)
    return  render_template('admin/Add and Manage expert.html', val=res)


@app.route('/adddataset',methods=['post'])
@login_required
def adddataset():
    return  render_template('admin/Add Dataset.html')


@app.route('/adddisease' ,methods=['post'])
@login_required
def adddisease():
    return  render_template('admin/Add disease.html')

@app.route('/addandmanagedisease')
@login_required
def addandmanagedisease():
    qry = "SELECT * FROM `disease`"
    res =selectall(qry)
    return  render_template('admin/Add disease and Manage disease.html', val=res)



@app.route('/deletedisease')
@login_required
def deletedisease():
    id=request.args.get('id')
    qry=" delete from disease where Did=%s"
    iud(qry,id)
    return '''<script>alert('deleted');window.location="/addandmanagedisease"</script>'''


@app.route('/insert_disease',methods=['post'])
@login_required
def insert_disease():
    disease=request.form['textfield']
    qry="insert into disease values(null,%s)"
    val=(disease)
    iud(qry,val)
    return '''<script>alert('success');window.location="/addandmanagedisease"</script>'''

@app.route('/addexpert',methods=['post'])
@login_required
def addexpert():
    return  render_template('admin/Add Expert.html')

@app.route('/insert_expert',methods=['post'])
@login_required
def insert_expert():
    fname=request.form['textfield']
    lname=request.form['textfield2']
    place=request.form['textfield3']
    post=request.form['textfield31']
    pin=request.form['textfield32']
    email=request.form['textfield4']
    phone=request.form['textfield5']
    uname=request.form['textfield6']
    passwd=request.form['textfield7']
    area=request.form['textfield8']
    qry="insert into login values(null,%s,%s,'expert')"
    val=(uname,passwd)
    lid=iud(qry,val)
    qry1="insert into expert values(null,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    val1=(str(lid),fname,lname,place,post,pin,email,phone,area)
    iud(qry1,val1)
    return '''<script>alert('success');window.location="/addandmanageexprt"</script>'''




@app.route('/edtexp')
@login_required
def edtexp():
    id=request.args.get('id')
    session['eid']=id
    qry="select * from expert where eid=%s"
    res=selectone(qry,id)
    return  render_template('admin/Edit expert.html',val=res)

@app.route('/edit_expert',methods=['post'])
@login_required
def edit_expert():
    fname=request.form['textfield']
    lname=request.form['textfield2']
    place=request.form['textfield3']
    post=request.form['textfield31']
    pin=request.form['textfield32']
    email=request.form['textfield4']
    phone=request.form['textfield5']
    area=request.form['textfield8']
    qry1="UPDATE `expert` SET Fname=%s,Lname=%s,place=%s,Post=%s,Pin=%s,Email=%s,Phone=%s,`area`=%s WHERE eid=%s"
    val1=(fname,lname,place,post,pin,email,phone,area,session['eid'])
    iud(qry1,val1)
    return '''<script>alert('success');window.location="/addandmanageexprt"</script>'''




@app.route('/deleteexp')
@login_required
def deleteexp():
    id=request.args.get('id')
    qry=" delete from expert where lid=%s"
    iud(qry,id)
    qr="delete from login where lid=%s"
    iud(qr,id)
    return '''<script>alert('deleted');window.location="/addandmanageexprt"</script>'''



@app.route('/addhomeremedies',methods=['post'])
@login_required
def addhomeremedies():
    qry="select * from disease"
    res=selectall(qry)
    return  render_template('admin/Add Home remedies.html',val=res)

@app.route('/addormanagedataset')
@login_required
def addormanagedataset():
    qry = "SELECT * FROM dataset"
    res =selectall(qry)
    return  render_template('admin/Add or Manage Dataset.html', val=res)

@app.route('/deletedataset')
@login_required
def deletedataset():
    id=request.args.get('id')
    qry=" delete from `dataset` where Dataid=%s"
    iud(qry,id)
    return '''<script>alert('deleted');window.location="/addormanagedataset"</script>'''


@app.route('/insert_dataset',methods=['post'])
@login_required
def insert_dataset():
    question=request.form['textfield']
    answer= request.form['textfield2']
    qry="insert into dataset values(null,%s,%s)"
    val=(question,answer)
    iud(qry,val)
    return '''<script>alert('success');window.location="/addormanagedataset"</script>'''

@app.route('/addormanagehomeremedies')
@login_required
def addormanagehomeremedies():
    qry = "SELECT disease.`Name`AS dname,`home remedies`.* FROM `home remedies`JOIN `disease` ON `disease`.`Did`=`home remedies`.`Did`"
    res =selectall(qry)
    return  render_template('admin/Add or Manage Home Remedies.html', val=res)



@app.route('/deletehomeremdy')
@login_required
def deletehomeremdy():
    id=request.args.get('id')
    qry=" delete from `home remedies` where Hid=%s"
    iud(qry,id)
    return '''<script>alert('deleted');window.location="/addormanagehomeremedies"</script>'''


@app.route('/insert_homeremedies',methods=['post'])
@login_required
def insert_homeremedies():
    Disease=request.form['select']
    Name= request.form['textfield']
    Remedy=request.form['textfield2']
    qry="insert into `home remedies` values(null,%s,%s,%s)"
    val=(Disease,Name,Remedy)
    iud(qry,val)
    return '''<script>alert('success');window.location="/addormanagehomeremedies"</script>'''

@app.route('/blockorunblock')
@login_required
def blockorunblock():
    qry ="SELECT `expert`.* ,`login`.`type` FROM `login` JOIN `expert` ON `expert`.`lid`=`login`.lid"
    res = selectall(qry)
    return  render_template('admin/Block or Unblock.html', val=res)

@app.route('/block')
@login_required
def block():
    id=request.args.get('id')
    qry="update login set type='blocked' where lid=%s"
    iud(qry,id)
    return '''<script>alert('Blocked');window.location="/blockorunblock#about"</script>'''



@app.route('/unblock')
@login_required
def unblock():
    id=request.args.get('id')
    qry="update login set type='expert' where lid=%s"
    iud(qry,id)
    return '''<script>alert('Unblocked');window.location="/blockorunblock#about"</script>'''

@app.route('/home')
@login_required
def home():
    return  render_template('admin/Home.html')

@app.route('/reply')
@login_required
def reply():
    id=request.args.get('id')
    session['cid']=id
    return  render_template('admin/Reply.html')



@app.route('/sndreply',methods=['post'])
@login_required
def sendreply():
    reply=request.form['textfield']
    qry="UPDATE `complaint` SET Reply=%s WHERE Cid=%s"
    val=(reply,session['cid'])
    iud(qry,val)
    return '''<script>alert('success');window.location="/viewcomplaint"</script>'''


@app.route('/viewcomplaint')
@login_required
def viewcomplaint():
    qry = "SELECT `user`.`Fname`,`Lname`,`complaint`.* FROM `complaint` JOIN `user` ON `complaint`.`lid`=`user`.`lid` where complaint.reply='pending'"
    res = selectall(qry)
    return  render_template('admin/View complaint.html', val=res)

@app.route('/viewrating')
@login_required
def viewrating():
    qry="SELECT `expert`.Fname AS fnm,`expert`.Lname AS lnm,`user`.*,`rating`.* FROM `expert` JOIN `rating` ON `expert`.lid=`rating`.Eid JOIN `user` ON `rating`.lid=`user`.lid"
    res=selectall(qry)
    return  render_template('admin/View Rating.html',val=res)

@app.route('/addandmanagesuggestions')
@login_required
def addandmanagesuggestions():
    qry="SELECT *FROM `suggestions` WHERE Eid=%s"
    res=selectall2(qry,session['lid'])
    return  render_template('expert/Add and Manage Suggestions.html',val=res)

@app.route('/deletesuggestions')
@login_required
def deletesuggestions():
    id=request.args.get('id')
    qry=" delete from `suggestions` where Sid=%s"
    iud(qry,id)
    return '''<script>alert('deleted');window.location="/addandmanagesuggestions"</script>'''


@app.route('/insert_suggestions',methods=['post'])
@login_required
def insert_suggestions():
    Suggestions=request.form['textfield']
    Description= request.form['textfield2']
    qry="INSERT INTO `suggestions` VALUES(null,%s,%s,%s,curdate())"
    val=(session['lid'],Suggestions,Description)
    iud(qry,val)
    return '''<script>alert('success');window.location="/addandmanagesuggestions"</script>'''


@app.route('/addandmanagesymptoms')
@login_required
def addandmanagesymptoms():
    qry="SELECT * FROM`disease`JOIN `symptoms` ON `symptoms`.Did=`disease`.Did"
    res=selectall(qry)
    return  render_template('expert/Add and Manage Symptoms.html',val=res)

@app.route('/deletesymptoms')
@login_required
def deletesymptoms():
    id=request.args.get('id')
    qry=" delete from `symptoms` where Sid=%s"
    iud(qry,id)
    return '''<script>alert('deleted');window.location="/addandmanagesymptoms"</script>'''

@app.route('/insert_symptoms',methods=['post'])
@login_required
def insert_symptoms():
    Disease=request.form['select']
    Symptoms= request.form['textfield']
    qry="INSERT INTO `symptoms` VALUES(null,%s,%s)"
    val=(Disease,Symptoms)
    iud(qry,val)
    return '''<script>alert('success');window.location="/addandmanagesymptoms"</script>'''

@app.route('/addsuggestions',methods=['post'])
@login_required
def addsuggestions():
    qry="SELECT * FROM `suggestions`"
    res=selectall(qry)
    return  render_template('expert/Add suggestions.html',val=res)

@app.route('/addsymptoms',methods=['post'])
@login_required
def addsymptoms():
    qry = "select * from disease"
    res = selectall(qry)
    return  render_template('expert/Add Symptoms.html',val=res)

@app.route('/chatwithuser')
@login_required
def chatwithuser():
    qry="SELECT *FROM `user`"
    res=selectall(qry)
    return  render_template('expert/Chat with User.html',val=res)

@app.route('/expert_home')
@login_required
def expert_home():
    return  render_template('expert/Home.html')

@app.route('/chatwithexperts')
@login_required
def chatwithexperts():
    return  render_template('user/Chat with Experts.html')

@app.route('/chatbot')
@login_required
def chatbot():
    return  render_template('user/Chatbot.html')

@app.route('/diseaseprediction')
@login_required
def diseaseprediction():
    q="SELECT * FROM `symptoms`"
    res=selectall(q)
    print(res)
    session['sypt']=""
    return  render_template('user/Disease Prediction.html',data=res)

@app.route('/add_sympt',methods=['post'])
def add_sympt():
    sypt=request.form['select']
    sym=""
    if 'sypt' in session:
        sym=session['sypt']
    if sypt not in sym:
        sym+=sypt+"#"
    session['sypt']=sym
    q = "SELECT * FROM `symptoms`"
    res = selectall(q)
    print(res)
    s=sym.split('#')
    return render_template('user/Disease Prediction.html', data=res,sypt=s)

@app.route('/delete_ss')
def delete_ss():
    id=request.args.get("id")
    sym = session['sypt']
    sym=sym.replace(id+"#","")
    print(sym,"=====================")
    session['sypt']=sym
    q = "SELECT * FROM `symptoms`"
    res = selectall(q)
    print(res)
    s=sym.split('#')
    return render_template('user/Disease Prediction.html', data=res,sypt=s)

@app.route('/predict',methods=['get','post'])
def predict():
    s= session['sypt']
    syms= s.split("#")
    print(syms)
    symrow = []
    for i in syms:
        # r="'"+i+"'"
        if i != "":
            symrow.append(i)
    print(symrow)
    symrow = ",".join(symrow)
    print(symrow)
    symrow = "'" + symrow + "'"
    symrow = symrow.replace(",", "','")
    qry = "SELECT distinct `disease_id` FROM `symptoms` WHERE `symptom` IN(" + symrow + ")"
    resss = selectall(qry)

    distdi = []
    for i in resss:
        distdi.append(str(i['disease_id']))

    distdi = ','.join(distdi)

    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db='health_chatbot')
    cmd = con.cursor()
    print(request.form)

    cmd.execute("select distinct symptom from symptoms WHERE `disease_id` IN(" + distdi + ") order by symptom")
    s = cmd.fetchall()
    print(s)
    dsym = []
    for i in s:
        dsym.append(i[0])
    row = []
    for w in dsym:
        if w in syms:
            row.append(1)
        else:
            row.append(0)

    ress = prep([row], distdi)
    qry = "select disease,treatment,preventive_measure,did from disease where disease_id=" + str(ress)
    cmd.execute(qry)
    res = cmd.fetchone()
    print(res)
    print(res[0], "aaaaaaaaaaaaaa")

    # return jsonify({"task": res[0], "t": res[1], "pm": res[2], "did": str(res[3])})
    return render_template('user/predict.html',task=res[0],t=res[1],pm=res[2])

@app.route('/user_home')
@login_required
def user_home():
    return  render_template('user/Home.html')

@app.route('/registeration')
def registeration():
    return  render_template('indexreg.html')

@app.route('/user_register',methods=['post'])
def user_register():
    Fname=request.form['textfield']
    Lname=request.form['textfield2']
    Email=request.form['textfield3']
    Username=request.form['textfield4']
    Password=request.form['textfield5']
    Place=request.form['textfield6']
    Pin=request.form['textfield7']
    Post=request.form['textfield8']
    Phone=request.form['textfield9']
    qry="insert into login values(null,%s,%s,'user')"
    val=(Username,Password)
    lid=iud(qry,val)
    qry1="insert into user values(null,%s,%s,%s,%s,%s,%s,%s,%s)"
    val1=(str(lid),Fname,Lname,Place,Post,Pin,Email,Phone)
    iud(qry1,val1)
    return '''<script>alert('success');window.location="/registeration"</script>'''

@app.route('/sendrating')
@login_required
def sendrating():
    qry="SELECT *FROM `expert`"
    res = selectall(qry)
    return  render_template('user/Send rating.html',val=res)


@app.route('/sendrate',methods=['post'])
@login_required
def sendrate():
    ename=request.form['select']
    rating=request.form['select2']
    qry="INSERT INTO `rating` VALUES(null,%s,%s,curdate(),%s)"
    val=(ename,rating,session['lid'])
    iud(qry,val)
    return '''<script>alert('success');window.location="/sendrating"</script>'''

@app.route('/viewandupdateprofile')
@login_required
def viewandupdateprofile():
    qry="SELECT * FROM `user` WHERE lid=%s"
    res=selectone(qry,session['lid'])
    print(res)
    return  render_template('user/View and Update profile.html',val=res)


@app.route('/updateprofile',methods=['post'])
@login_required
def updateprofile():
    Fname = request.form['textfield']
    Lname = request.form['textfield2']
    Phone = request.form['textfield8']
    Email = request.form['textfield3']
    Place = request.form['textfield6']
    Post = request.form['textfield8']
    Pin = request.form['textfield7']
    qry="UPDATE `user` SET Fname=%s, Lname=%s, Phone=%s, Email=%s, Place=%s, Post=%s, Pin=%s WHERE lid=%s"
    val=(Fname,Lname,Phone,Email,Place,Post,Pin,session['lid'])
    iud(qry,val)
    return '''<script>alert('success');window.location="/viewandupdateprofile"</script>'''






@app.route('/viewexpert')
@login_required
def viewexpert():
    qry="SELECT *FROM `expert`"
    res=selectall(qry)
    return  render_template('user/View Expert.html',val=res)





@app.route("/chat2")
@login_required
def chatsp():
    pid=request.args.get('uid')
    print(pid,"==============================")
    session['pid']=pid
    qry="SELECT * FROM `expert` WHERE `lid`=%s"
    res=selectone(qry,pid)


    print(res)


    qry="SELECT * FROM `chat` WHERE `fromid`=%s AND `toid`=%s OR `fromid`=%s AND `toid`=%s "
    val=(session['lid'],session['pid'],session['pid'],session['lid'])
    res1=selectall2(qry,val)

    print(res)

    fname=res['Fname']
    lname=res['Lname']
    return render_template("user/chat2.html",data=res1,fname=fname,lname=lname,fr=session['lid'])



@app.route('/send',methods=['post'])
@login_required
def sendchat():
    message=request.form['textarea']
    to_id = session['pid']
    from_id = session['lid']
    qry="insert into chat values(null,%s,%s,%s,CURDATE())"
    val=(message,from_id,to_id)
    iud(qry,val)


    return redirect("chatss")
@login_required
@app.route("/chatss")
def chatss():
    pid=session['pid']
    qry="SELECT * FROM `expert` WHERE `lid`=%s"
    res=selectone(qry,pid)
    qry="SELECT * FROM `chat` WHERE `fromid`=%s AND `toid`=%s OR `fromid`=%s AND `toid`=%s "
    val=(session['lid'],session['pid'],session['pid'],session['lid'])
    res1=selectall2(qry,val)
    fname=res['Fname']
    lname=res['Lname']
    return render_template("user/chat2.html",data=res1,fname=fname,lname=lname,fr=session['lid'])



@app.route('/viewhomeremedies')
@login_required
def viewhomeremedies():
    qry="SELECT *FROM`home remedies`"
    res=selectall(qry)
    return  render_template('user/View home remedies.html',val=res)

@app.route('/viewsuggestion')
@login_required
def viewsuggestion():
    id=request.args.get('id')
    session['sid']=id
    qry="SELECT *FROM `suggestions` where Eid=%s"
    res=selectall2(qry,session['sid'])
    return  render_template('user/View suggestion.html',val=res)

@app.route('/sendcomplaint',methods=["post"])
@login_required
def sendcomplaint():
    return  render_template('user/Send complaint.html')

@app.route('/sendcomplaintandviewreply')
@login_required
def sendcomplaintandviewreply():
    qry="SELECT *FROM`complaint`"
    res=selectall(qry)
    return  render_template('user/Send complaint and View reply.html',val=res)

@app.route('/insertcomplaint',methods=['post'])
@login_required
def insertcomplaint():
    Complaint = request.form['textfield']
    qry="INSERT INTO `complaint` VALUES(NULL,%s,%s,CURDATE(),'pending')"
    val=(session['lid'],Complaint)
    iud(qry,val)
    return '''<script>alert('success');window.location="/sendcomplaintandviewreply"</script>'''























@app.route("/chat22")
def chatspl():
    pid=request.args.get('uid')
    print(pid,"==============================")
    session['pid']=pid
    qry="SELECT * FROM `user` WHERE `lid`=%s"
    res=selectone(qry,pid)


    print(res)


    qry="SELECT * FROM `chat` WHERE `fromid`=%s AND `toid`=%s OR `fromid`=%s AND `toid`=%s "
    val=(session['lid'],session['pid'],session['pid'],session['lid'])
    res1=selectall2(qry,val)

    print(res)

    fname=res['Fname']
    lname=res['Lname']
    return render_template("expert/chat2.html",data=res1,fname=fname,lname=lname,fr=session['lid'])



@app.route('/sendd',methods=['post'])
def sendchatt():
    message=request.form['textarea']
    to_id = session['pid']
    from_id = session['lid']
    qry="insert into chat values(null,%s,%s,%s,CURDATE())"
    val=(message,from_id,to_id)
    iud(qry,val)

    return redirect("chatsss")



@app.route("/chatsss")
def chatsss():
    pid=session['pid']
    qry="SELECT * FROM `user` WHERE `lid`=%s"
    res=selectone(qry,pid)
    qry="SELECT * FROM `chat` WHERE `fromid`=%s AND `toid`=%s OR `fromid`=%s AND `toid`=%s "
    val=(session['lid'],session['pid'],session['pid'],session['lid'])
    res1=selectall2(qry,val)
    fname=res['Fname']
    lname=res['Lname']
    return render_template("expert/chat2.html",data=res1,fname=fname,lname=lname,fr=session['lid'])


app.run(debug=True)