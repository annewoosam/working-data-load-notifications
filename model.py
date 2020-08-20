
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Notification(db.Model):
    """Data model for a notification."""

    __tablename__ = 'notifications'

    notification_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    checklistid = db.Column(db.Integer, nullable=False)
    datesenttoreview = db.Column(db.Date())
    reviewerfullname = db.Column(db.String())
    revieweremail = db.Column(db.String())
    datereviewcomplete = db.Column(db.Date())
    recipientfullname = db.Column(db.String())
    recipientemail = db.Column(db.String())
    datetorecipient = db.Column(db.Date())

    def __repr__(self):
        """Provide helpful representation when printing."""

        return f'<notification notification_id={self.notification_id} checklistid={self.checklistid}>'


def connect_to_db(app):
    """Connect the database to our Flask app."""

    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgres:///notifications'
    app.config['SQLALCHEMY_ECHO'] = False
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


if __name__ == '__main__':
    from server import app

    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.
    connect_to_db(app)
    print('Connected to db!')
