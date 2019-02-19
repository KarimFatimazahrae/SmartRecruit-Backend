from flask import Flask, request, jsonify
from flaskext.mysql import MySQL

app = Flask(__name__)
mysql = MySQL()

# Prevent flask jsonify from sorting data
app.config['JSON_SORT_KEYS'] = False

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
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
            return jsonify({'error': str(e)})

@app.route('/apply')
def applyOffer():
    applicant = request.args.get('applicant')
    appid = request.args.get('appid')
    try:
	    cur = mysql.connect().cursor()
	    sql = '''insert into candidat_offre(id_candidat, id_offre) values(%s, %s)'''
	    cur.execute(sql, (applicant, appid))
	    return jsonify({'response':'success'})
    except Exception as e:
            return jsonify({'error': 'Exception'})
			
			

@app.route('/applications')
def getOfferCandidat():
    applicant = request.args.get('applicant')
    
    try:
	    cur = mysql.connect().cursor()
	    sql = '''SELECT * FROM offre , candidat_offre where candidat_offre.id_offre = offre.id_offre and id_candidat = %s'''
	    cur.execute(sql, (applicant))
	    candidatApplications = []
	    for row in cur.fetchall():
		candidatApplication = {'id': row[0], 
	    	'position': row[1], 
	    	'company': row[2], 
	    	'location': row[3], 
	    	'datePosted': row[4], 
	    	'contract': row[5], 
	    	'description': row[6], 
	    	'img': row[7]}
	    	candidatApplications.append(candidatApplication)
	    return jsonify({'response': 'success', 'results-for': 'applications','job-applications':candidatApplications})
    except Exception as e:
	    return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(host='0.0.0.0')
