
from flask import Flask, jsonify, render_template
from model import connect_to_db, Notification


app = Flask(__name__)


@app.route('/')
def homepage():
    """Show the homepage."""

    return render_template('index.html')


@app.route('/api/notification/<int:notification_id>')
def get_notification(notification_id):
    """Return a notifications from the database as JSON."""

    notification = Notification.query.get(notification_id)

    if notification:
        return jsonify({'status': 'success',
                        'notification_id': notification.notification_id,
                        'checklistid': notification.checklistid,
                        'datesenttoreview': notification.datesenttoreview,
                        'reviewerfullname': notification.reviewerfullname,
                        'revieweremail': notification.revieweremail,
                        'datereviewcomplete': notification.datereviewcomplete,
                        'recipientfullname': notification.recipientfullname,
                        'recipientemail': notification.recipientemail,
                        'datetorecipient': notification.datetorecipient})
    else:
        return jsonify({'status': 'error',
                        'message': 'No notification found with that ID'})


if __name__ == '__main__':
    connect_to_db(app)
    app.run(host='0.0.0.0', debug=True)