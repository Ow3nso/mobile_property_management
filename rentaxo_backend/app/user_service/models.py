# ---------- Imports ---------
from datetime import datetime
from werkzeug.security import generate_password_hash, check_password_hash
from wtforms.validators import Email, ValidationError

from app import db
from app.user_service import *

# ---------- Validators ----------
def validate_email_format(email):
    try:
        Email()(None, email)
    except ValidationError:
        raise ValueError(f"Invalid email format: {email}")

# ---------- Models ----------
class User(db.Model):
    __tablename__ = 'user'

    id = db.Column(db.Integer, primary_key=True, unique=True)
    full_name = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    phone_number = db.Column(db.String(20), nullable=False)
    password_hash = db.Column(db.String(280), nullable=False)  
    role = db.Column(db.Enum(UserRole), nullable=False)
    created_at = db.Column(db.DateTime, nullable=False, default=datetime.now)
    updated_at = db.Column(db.DateTime, nullable=False, default=datetime.now, onupdate=datetime.now)

    tenant = db.relationship('Tenant', uselist=False, backref='user')
    manager = db.relationship('Manager', uselist=False, backref='user')

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

    def __repr__(self):
        return f"<User {self.email}>"

    @staticmethod
    def validate_email(email):
        validate_email_format(email)

    @classmethod
    def create(cls, full_name, email, phone_number, password, role):
        cls.validate_email(email)
        user = cls(
            full_name=full_name,
            email=email,
            phone_number=phone_number,
            role=role
        )
        user.set_password(password)
        return user


class Manager(db.Model):
    __tablename__ = 'manager'

    id = db.Column(db.Integer, db.ForeignKey('user.id'), primary_key=True)
    property = db.relationship('Property', backref='managed_properties', lazy=True)

    def __repr__(self):
        return f"<Manager {self.id}>"
    
class Tenant(db.Model):
    __tablename__ = 'tenant'

    id = db.Column(db.Integer, db.ForeignKey('user.id'), primary_key=True)
    lease = db.relationship('Lease', backref='tenant', lazy=True)

    def __repr__(self):
        return f"<Tenant {self.id}>"

class Property(db.Model):
    __tablename__ = 'property'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text, nullable=True)
    address = db.Column(db.String(250), nullable=False)
    property_type = db.Column(db.Enum(PropertyType), nullable=False)
    num_units = db.Column(db.Integer, default=1)

    manager = db.Column(db.Integer, db.ForeignKey('manager.id'), nullable=False)
    amenities = db.relationship('PropertyAmenity', backref='property', lazy=True)
    units = db.relationship('Unit', backref='property', lazy=True)

    def __repr__(self):
        return f"<Property {self.id}>"
    
class Unit(db.Model):
    __tablename__ = "unit"

    id = db.Column(db.Integer, primary_key=True)
    unit_number = db.Column(db.String(50), nullable=False)  
    unit_type = db.Column(db.Enum(UnitType), nullable=False)
    floor = db.Column(db.String(10), nullable=True)  
    num_bedrooms = db.Column(db.Integer, nullable=False)
    rent_amount = db.Column(db.Numeric(10, 2), nullable=False) 
    is_occupied = db.Column(db.Boolean, default=False)  

    property_id = db.Column(db.Integer, db.ForeignKey('property.id'), nullable=False)
    amenities = db.relationship('UnitAmenity', backref='unit', lazy=True)  
    leases = db.relationship('Lease', backref='unit', lazy=True)

    def __repr__(self):
        return f"<Unit {self.id}>"
    
class Lease(db.Model):
    __tablename__ = "lease"

    id = db.Column(db.Integer, primary_key=True)
    start_date = db.Column(db.Date, nullable=False)
    end_date = db.Column(db.Date, nullable=False)
    rent_due_date = db.Column(db.Date, nullable=False)  
    status = db.Column(db.Enum(LeaseStatus), default='ACTIVE', nullable=False)

    tenant_id = db.Column(db.Integer, db.ForeignKey('tenant.id'), nullable=False)  
    unit_id = db.Column(db.Integer, db.ForeignKey('unit.id'), nullable=False)  

    def __repr__(self):
        return f"<Lease {self.id}>"
    
class Amenity(db.Model):
    __tablename__ = "amenity"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False, unique=True)  
    description = db.Column(db.Text, nullable=True) 

    properties = db.relationship('PropertyAmenity', backref='amenity', lazy=True)
    units = db.relationship('UnitAmenity', backref='amenity', lazy=True)

    def __repr__(self):
        return f"<Amenity {self.id}>"
    
class PropertyAmenity(db.Model):
    __tablename__ = "property_amenity"

    id = db.Column(db.Integer, primary_key=True)
    property_id = db.Column(db.Integer, db.ForeignKey('property.id'), nullable=False)
    amenity_id = db.Column(db.Integer, db.ForeignKey('amenity.id'), nullable=False)

    def __repr__(self):
        return f"<PropertyAmenity {self.id}>"
    
class UnitAmenity(db.Model):
    __tablename__ = "unit_amenity"

    id = db.Column(db.Integer, primary_key=True)
    unit_id = db.Column(db.Integer, db.ForeignKey('unit.id'), nullable=False)
    amenity_id = db.Column(db.Integer, db.ForeignKey('amenity.id'), nullable=False)

    def __repr__(self):
        return f"<UnitAmenity {self.id}>"