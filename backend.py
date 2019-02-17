from flask import Flask, jsonify
from flaskext.mysql import MySQL

app = Flask(__name__)
mysql = MySQL()

# Prevent flask jsonify from sorting data
app.config['JSON_SORT_KEYS'] = False

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = '0000'
app.config['MYSQL_CHARSET'] = 'utf-8'
app.config['MYSQL_DATABASE_DB'] = 'smartrecruit'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql.init_app(app)


# Api acces routes
@app.route('/offers')
def getOffers():
	try:
	    cur = mysql.connect().cursor()
	    cur.execute('''select * from offre''')
	    jobOffers = []
	    for row in cur.fetchall():
	    	jobOffer = {'id': row[0], 
	    	'position': row[1], 
	    	'company': row[2], 
	    	'location': row[3], 
	    	'datePosted': row[4], 
	    	'contract': row[5], 
	    	'description': row[6], 
	    	'img': row[7]}
	    	jobOffers.append(jobOffer)
	    return jsonify({'response': 'success', 'results-for': 'offers','job-offers':jobOffers})
	except Exception as e:
            return {'error': str(e)}

if __name__ == '__main__':
    app.run(host='0.0.0.0')