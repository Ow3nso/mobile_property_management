from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_jwt_extended import JWTManager
from flask_migrate import Migrate
from app.config import Config

db = SQLAlchemy()
migrate = Migrate()

def create_app(config_name=None):
    app = Flask(__name__)
    app.config.from_object(Config)

    jwt = JWTManager(app)

    # Initialize database and migration
    db.init_app(app)
    migrate.init_app(app, db)

    # Register routes from all microservices
    register_all_routes(app)

    return app

def register_all_routes(app):
    from app.user_service.urls import register_routes as register_user_routes

    # Register each microservice's routes
    register_user_routes(app)