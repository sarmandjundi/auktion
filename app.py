
# Create Environment
# pip install flask
# pip install pymysql
# pip install flask-mysql

from flask import Flask, jsonify, request, session
import pymysql
from flaskext.mysql import MySQL

app = Flask(__name__)
app.config.update(
    DEBUG=True,
    SECRET_KEY="secret_sauce",
    SESSION_COOKIE_HTTPONLY=True,
    REMEMBER_COOKIE_HTTPONLY=True,
    SESSION_COOKIE_SAMESITE="Strict",
)

# connect database
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'jagkommer3'
app.config['MYSQL_DATABASE_DB'] = 'auktion'
app.config['MYSQL_DATABASE_HOST'] = '127.0.0.1'
mysql.init_app(app)


# login
@app.route("/api/login", methods=["POST"])
def login():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        query = "SELECT * FROM user WHERE email = %s AND password = %s"
        bind = (request.json['email'], request.json['password'])
        cursor.execute(query, bind)
        user = cursor.fetchone()        
        if user['email']:
            session['user'] = user
            return jsonify({"login": True})
    except Exception as e:
        return jsonify({"login": False})
    finally:
        cursor.close()
        conn.close()
        
@app.route("/api/register", methods=["POST"])
def register():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        query = "INSERT INTO user (firstname, lastname, email, password) VALUES (%s, %s, %s, %s)"
        bind = (request.json['firstname'], request.json['lastname'], request.json['email'], request.json['password'])
        cursor.execute(query, bind)
        conn.commit()
        user = cursor.fetchall()        
        #if user['email']:
            #session['user'] = user
        return jsonify({"register": True})
    except Exception as e:
        return jsonify({"register": False})
    finally:
        cursor.close()
        conn.close()



# check if logged in
@app.route("/api/login", methods=["GET"])
def check_session():
    if session.get('user'):
        return jsonify({"login": True})

    return jsonify({"login": False})


# logout
@app.route("/api/login", methods=["DELETE"])
def logout():
    session['user'] = {}
    return jsonify({"logout": True})


# get current user
@app.route("/api/user", methods=["GET"])
def user_data():
    if session.get('user'):
        return jsonify(session['user'])

    return jsonify({"login": False})


# this route should only work if logged in
@app.route("/api/protected-data", methods=["GET"])
def protected_data():
    if session.get('user'):
        return jsonify({"get-this-data": "Only if logged in"})

    return jsonify({"login": False})


# login
@app.route("/api/updatebid", methods=["POST"])
def updatebid():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try: 
        query ="SELECT price, user_id FROM bid WHERE item_id = %s ORDER BY price LIMIT 1"
        bind = (request.json['item_id'])
        cursor.execute(query, bind)
        biditem = cursor.fetchone()
        if not (biditem["user_id"] == request.json["user_id"]):
            if biditem["price"] < request.json["price"]:
                query = "UPDATE bid SET price = %s WHERE item_id = %s"
                bind = (request.json['price'],request.json['item_id'])
                cursor.execute(query, bind)
                conn.commit()
                return jsonify({"updated": "your bid have been registred! " })
            else: 
                return jsonify({"updated": "you need to put a heigher bid! " })
        else:
            return jsonify({"updated": "you cant bid on your own items" })
    except Exception as e:
        return jsonify({"update": str(e)})
    finally:
        cursor.close()
        conn.close()
        
        
        
        
@app.route("/api/additem", methods=["POST"])
def additem():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        query = "INSERT INTO item (title, description, start_time, end_time) VALUES (%s, %s, %s, %s)"
        bind = (request.json['title'],request.json['description'],request.json['start_time'],request.json['end_time'])
        cursor.execute(query, bind)
        conn.commit()    
        return jsonify({"additem": True })
    except Exception as e:
        return jsonify({"additem": str(e)})
    finally:
        cursor.close()
        conn.close()



@app.route('/api/getlistitem', methods=['GET'])
def getListItem():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        query = "SELECT id, title, SUBSTRING(description, 1,15) FROM item"
        cursor.execute(query)
        rows = cursor.fetchall()
        return jsonify({"data":rows})
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()
        
        
@app.route('/api/getitem', methods=['GET'])
def getItem():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        query = "SELECT * FROM item WHERE id =%s"
        bind = (request.json['id'])
        cursor.execute(query, bind)
        rows = cursor.fetchall()
        return jsonify({"data":rows})
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()
        
        
@app.route('/api/getitemwithpicture', methods=['GET'])
def getItemWithPicture():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        query = "SELECT title, description, start_time, end_time, picture.url FROM item left join picture on picture.item_id = item.id"
        cursor.execute(query)
        rows = cursor.fetchall()
        return jsonify({"ITEMWITHPICTURE":rows})
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()
        
        
@app.route('/api/getcurrentbid', methods=['GET'])
def getCurrentBid():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        query = "SELECT start_time, end_time, bid.price , item.id FROM item LEFT JOIN bid ON bid.user_id= bid.id"
        cursor.execute(query)
        rows = cursor.fetchall()
        return jsonify({"CURRENTBID":rows})
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()
        
        
        
@app.route('/api/getfivelatestbids', methods=['GET'])
def getFiveLatestBids():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        query = "SELECT * FROM bid JOIN item ON item_id = item.id WHERE item.id = 1 ORDER BY price DESC LIMIT 5"
        cursor.execute(query)
        rows = cursor.fetchall()
        return jsonify({"getfivelatestbids":rows})
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()



# this route should work even if you are not logged in
@app.route("/api/unprotected-data", methods=["GET"])
def unprotected_data():
    return jsonify({"get-this-data": "Even if you are logged out"})

@app.route("/api/user", methods=["post"])
def insert_user():
    return jsonify(request.json)
if __name__ == "__main__":
    app.run(debug=True, load_dotenv=True)


        
        
         
