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
	applicant = request.args.get('applicant')
	try:
	    cur = mysql.connect().cursor()
	    jobOffers = []
	    sql = '''SELECT * FROM offre WHERE id_offre NOT IN (SELECT id_offre FROM candidat_offre WHERE id_candidat=%s) AND id_offre NOT IN (SELECT id_offre FROM favoris WHERE id_candidat=%s)'''
	    cur.execute(sql, (applicant, applicant))
	    for row in cur.fetchall():
	    	jobOffer = {'id': row[0], 
	    	'position': row[1], 
	    	'company': row[2], 
	    	'location': row[3], 
	    	'datePosted': row[4],
	    	'description': row[5], 
	    	'img': row[6]}
	    	jobOffers.append(jobOffer)
	    return jsonify({'response': 'success', 'results-for': 'offers','job-offers':jobOffers})
	except Exception as e:
            return jsonify({'error': str(e)})

# Favorite offers
@app.route('/favorites')
def getFavorites():
	applicant = request.args.get('applicant')
	try:
	    cur = mysql.connect().cursor()
	    jobOffers = []
	    cur.execute('''SELECT * FROM offre WHERE id_offre IN (SELECT id_offre FROM favoris)''')
	    for row in cur.fetchall():
	    	jobOffer = {'id': row[0], 
	    	'position': row[1], 
	    	'company': row[2], 
	    	'location': row[3], 
	    	'datePosted': row[4], 
	    	'description': row[5], 
	    	'img': row[6]}
	    	jobOffers.append(jobOffer)
	    return jsonify({'response': 'success', 'results-for': 'favorites','job-offers':jobOffers})
	except Exception as e:
            return jsonify({'error': str(e)})

# Applications for a user
@app.route('/applications')
def getOfferCandidat():
    applicant = request.args.get('applicant')
    try:
	    cur = mysql.connect().cursor()
	    sql = '''SELECT offre.*, etat FROM offre, candidat_offre WHERE offre.id_offre=candidat_offre.id_offre AND id_candidat=%s AND etat<>'SUPPRIME' ORDER BY etat'''
	    cur.execute(sql, (applicant))
	    candidatApplications = []
	    for row in cur.fetchall():
                candidatApplication = {'id': row[0], 
		'position': row[1], 
		'company': row[2], 
		'location': row[3], 
		'datePosted': row[4], 
		'description': row[5], 
		'img': row[6], 
		'etat': row[7]}
                candidatApplications.append(candidatApplication)
	    return jsonify({'response': 'success', 'results-for': 'applications','job-applications':candidatApplications})
    except Exception as e:
	    return jsonify({'error': str(e)})

# update offer status to SUPPRIME, APP_ATT_RDV, APP_RDV_RECU, APP_REF, APP_ACC
@app.route('/updateStatus')
def updateStatus():
    status = request.args.get('status')
    applicant = request.args.get('applicant')
    offer = request.args.get('offer')
    try:
	    cur = mysql.connect().cursor()
	    sql = '''INSERT INTO candidat_offre (id_candidat, id_offre, etat) VALUES(%s, %s, %s) ON DUPLICATE KEY UPDATE etat=%s, id_candidat=%s, id_offre=%s'''
	    cur.execute(sql, (applicant, offer, status, status, applicant, offer))
	    return jsonify({'response':'success'})
    except Exception as e:
            return jsonify({'error': 'Exception'})

# add an offer to favorites
@app.route('/addFavorite')
def addFavorite():
    applicant = request.args.get('applicant')
    offer = request.args.get('offer')
    try:
	    cur = mysql.connect().cursor()
	    sql = '''INSERT INTO favoris (id_candidat, id_offre) VALUES(%s, %s)'''
	    cur.execute(sql, (applicant, offer))
	    return jsonify({'response':'success'})
    except Exception as e:
            return jsonify({'error': 'Exception'})

# Remove offer from favorites
@app.route('/removeFavorite')
def removeFavorite():
	applicant = request.args.get('applicant')
	offer = request.args.get('offer')
	try:
	    cur = mysql.connect().cursor()
	    sql = '''DELETE FROM favoris WHERE id_candidat=%s AND id_offre=%s'''
	    cur.execute(sql, (applicant, offer))
	    return jsonify({'response':'success'})
	except Exception as e:
            return jsonify({'error': str(e)})

# Schedule appointment to candidate
@app.route('/scheduleAppointment')
def scheduleAppointment():
	applicant = request.args.get('applicant')
	recuter = request.args.get('recruter')
	offer = request.args.get('offer')
	date = request.args.get('date')
	place = request.args.get('place')
	try:
	    cur = mysql.connect().cursor()
	    sql = '''INSERT INTO rendez_vous (id_offre, id_candidat, id_recruteur, date_heure, endroit) VALUES(%s, %s, %s, %s, %s)'''
	    cur.execute(sql, (offer, applicant, recruter, date, place))
	    return jsonify({'response':'success'})
	except Exception as e:
            return jsonify({'error': 'Exception'})

# Get applicants for a recruter
@app.route('/appointmentRequests')
def appointmentRequests():
	recruiter = request.args.get('recruiter')
	try:
	    cur = mysql.connect().cursor()
	    sql = '''select o.position, o.localisation, c.* from (select * from candidat_offre where etat='APP_RDV_ATT' and id_offre in (select id_offre from recruteur_offre where id_recruteur=%s)) as c, offre as o where o.id_offre = c.id_offre'''
	    cur.execute(sql, (recruiter))
	    appointmentReq = []
	    for row in cur.fetchall():
	    	req = {'position': row[0], 
	    	'location': row[1], 
	    	'applicant': row[2], 
		'offer': row[3]}
	    	appointmentReq.append(req)
	    return jsonify({'response': 'success', 'results-for': 'appointments','appointments-requests':appointmentReq})
	except Exception as e:
            return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(host='0.0.0.0')
