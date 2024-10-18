# ---------- Imports ----------
from flask import request, jsonify
from flask_restful import Resource
from flask_jwt_extended import create_access_token, jwt_required
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import timedelta

from .models import *
from .serializers import *

# ---------- Schemas ----------
user_schema = UserSchema()

# ---------- Endpoints ----------

from flask import request
from flask_restful import Resource
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import timedelta
from flask_jwt_extended import create_access_token, jwt_required

class UserRegistration(Resource):
    def post(self):
        try:
            data = request.get_json()

            errors = user_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            if User.query.filter_by(email=data['email']).first():
                return {"message": "User with this email already exists."}, 400

            hashed_password = generate_password_hash(data['password'])

            user = User(
                full_name=data['full_name'],
                email=data['email'],
                phone_number=data['phone_number'],
                password_hash=hashed_password,
                role=data['role']
            )

            db.session.add(user)
            db.session.flush()  

            if user.role == "MANAGER":
                manager = Manager(id=user.id)  
                db.session.add(manager)
            elif user.role == "TENANT":
                tenant = Tenant(id=user.id)  
                db.session.add(tenant)

            db.session.commit()

            return {
                "message": "User registered successfully.",
                "user": user_schema.dump(user),
            }, 201
        
        except Exception as e:
            db.session.rollback()
            raise e


class UserLogin(Resource):
    def post(self):
        try:
            data = request.get_json()

            user = User.query.filter_by(email=data.get('email')).first()
            if not user:
                return {"message": "Invalid email or password."}, 401

            if not check_password_hash(user.password_hash, data.get('password')):
                return {"message": "Invalid email or password."}, 401

            access_token = create_access_token(
                identity=user.id,
                expires_delta=timedelta(hours=24)
            )

            return {
                "message": "Login successful.",
                "access_token": access_token
            }, 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500


class ManagerList(Resource):
    @jwt_required()
    def get(self):
        try:
            managers = Manager.query.all()

            if not managers:
                return {"message": "No managers found"}, 404

            manager_schema = ManagerSchema(many=True)
            return manager_schema.dump(managers), 200

        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500


class ManagerDetail(Resource):
    @jwt_required()
    def get(self, manager_id):
        try:
            manager = Manager.query.get_or_404(manager_id)
            manager_schema = ManagerSchema()
            return manager_schema.dump(manager), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def put(self, manager_id):
        data = request.get_json()
        manager_schema = ManagerSchema()

        try:
            manager = Manager.query.get_or_404(manager_id)
            errors = manager_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            for key, value in data.items():
                setattr(manager, key, value)

            db.session.commit()
            return manager_schema.dump(manager), 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def delete(self, manager_id):
        try:
            manager = Manager.query.get_or_404(manager_id)
            db.session.delete(manager)
            db.session.commit()
            return {"message": "Manager deleted successfully"}, 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500
        
class TenantList(Resource):
    @jwt_required()
    def get(self):
        try:
            tenants = Tenant.query.all()
            tenant_schema = TenantSchema(many=True)
            return tenant_schema.dump(tenants), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500


class TenantDetail(Resource):
    @jwt_required()
    def get(self, tenant_id):
        try:
            tenant = Tenant.query.get_or_404(tenant_id)
            tenant_schema = TenantSchema()
            return tenant_schema.dump(tenant), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def put(self, tenant_id):
        data = request.get_json()
        tenant_schema = TenantSchema()

        try:
            tenant = Tenant.query.get_or_404(tenant_id)
            errors = tenant_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            for key, value in data.items():
                setattr(tenant, key, value)

            db.session.commit()
            return tenant_schema.dump(tenant), 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def delete(self, tenant_id):
        try:
            tenant = Tenant.query.get_or_404(tenant_id)
            db.session.delete(tenant)
            db.session.commit()
            return {"message": "Tenant deleted successfully"}, 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

class PropertyList(Resource):
    @jwt_required()
    def get(self):
        try:
            properties = Property.query.all()
            property_schema = PropertySchema(many=True)
            return property_schema.dump(properties), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def post(self):
        data = request.get_json()
        property_schema = PropertySchema()

        try:
            errors = property_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            property_ = Property(**data)
            db.session.add(property_)
            db.session.commit()
            return property_schema.dump(property_), 201

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500


class PropertyDetail(Resource):
    @jwt_required()
    def get(self, property_id):
        try:
            property_ = Property.query.get_or_404(property_id)
            property_schema = PropertySchema()
            return property_schema.dump(property_), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def put(self, property_id):
        data = request.get_json()
        property_schema = PropertySchema()

        try:
            property_ = Property.query.get_or_404(property_id)
            errors = property_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            for key, value in data.items():
                setattr(property_, key, value)

            db.session.commit()
            return property_schema.dump(property_), 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def delete(self, property_id):
        try:
            property_ = Property.query.get_or_404(property_id)
            db.session.delete(property_)
            db.session.commit()
            return {"message": "Property deleted successfully"}, 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

class UnitList(Resource):
    @jwt_required()
    def get(self):
        try:
            units = Unit.query.all()
            unit_schema = UnitSchema(many=True)
            return unit_schema.dump(units), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def post(self):
        data = request.get_json()
        unit_schema = UnitSchema()

        try:
            errors = unit_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            unit = Unit(**data)
            db.session.add(unit)
            db.session.commit()
            return unit_schema.dump(unit), 201

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500


class UnitDetail(Resource):
    @jwt_required()
    def get(self, unit_id):
        try:
            unit = Unit.query.get_or_404(unit_id)
            unit_schema = UnitSchema()
            return unit_schema.dump(unit), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def put(self, unit_id):
        data = request.get_json()
        unit_schema = UnitSchema()

        try:
            unit = Unit.query.get_or_404(unit_id)
            errors = unit_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            for key, value in data.items():
                setattr(unit, key, value)

            db.session.commit()
            return unit_schema.dump(unit), 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def delete(self, unit_id):
        try:
            unit = Unit.query.get_or_404(unit_id)
            db.session.delete(unit)
            db.session.commit()
            return {"message": "Unit deleted successfully"}, 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

class LeaseList(Resource):
    @jwt_required()
    def get(self):
        try:
            leases = Lease.query.all()
            lease_schema = LeaseSchema(many=True)
            return lease_schema.dump(leases), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def post(self):
        data = request.get_json()
        lease_schema = LeaseSchema()

        try:
            errors = lease_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            lease = Lease(**data)
            db.session.add(lease)
            db.session.commit()
            return lease_schema.dump(lease), 201

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500


class LeaseDetail(Resource):
    @jwt_required()
    def get(self, lease_id):
        try:
            lease = Lease.query.get_or_404(lease_id)
            lease_schema = LeaseSchema()
            return lease_schema.dump(lease), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def put(self, lease_id):
        data = request.get_json()
        lease_schema = LeaseSchema()

        try:
            lease = Lease.query.get_or_404(lease_id)
            errors = lease_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            for key, value in data.items():
                setattr(lease, key, value)

            db.session.commit()
            return lease_schema.dump(lease), 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def delete(self, lease_id):
        try:
            lease = Lease.query.get_or_404(lease_id)
            db.session.delete(lease)
            db.session.commit()
            return {"message": "Lease deleted successfully"}, 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

class AmenityList(Resource):
    @jwt_required()
    def get(self):
        try:
            amenities = Amenity.query.all()
            amenity_schema = AmenitySchema(many=True)
            return amenity_schema.dump(amenities), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def post(self):
        data = request.get_json()
        amenity_schema = AmenitySchema()

        try:
            errors = amenity_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            amenity = Amenity(**data)
            db.session.add(amenity)
            db.session.commit()
            return amenity_schema.dump(amenity), 201

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500


class AmenityDetail(Resource):
    @jwt_required()
    def get(self, amenity_id):
        try:
            amenity = Amenity.query.get_or_404(amenity_id)
            amenity_schema = AmenitySchema()
            return amenity_schema.dump(amenity), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def put(self, amenity_id):
        data = request.get_json()
        amenity_schema = AmenitySchema()

        try:
            amenity = Amenity.query.get_or_404(amenity_id)
            errors = amenity_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            for key, value in data.items():
                setattr(amenity, key, value)

            db.session.commit()
            return amenity_schema.dump(amenity), 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def delete(self, amenity_id):
        try:
            amenity = Amenity.query.get_or_404(amenity_id)
            db.session.delete(amenity)
            db.session.commit()
            return {"message": "Amenity deleted successfully"}, 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

class PropertyAmenityList(Resource):
    @jwt_required()
    def get(self):
        try:
            property_amenities = PropertyAmenity.query.all()
            property_amenity_schema = PropertyAmenitySchema(many=True)
            return property_amenity_schema.dump(property_amenities), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def post(self):
        data = request.get_json()
        property_amenity_schema = PropertyAmenitySchema()

        try:
            errors = property_amenity_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            property_amenity = PropertyAmenity(**data)
            db.session.add(property_amenity)
            db.session.commit()
            return property_amenity_schema.dump(property_amenity), 201

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500


class PropertyAmenityDetail(Resource):
    @jwt_required()
    def get(self, property_amenity_id):
        try:
            property_amenity = PropertyAmenity.query.get_or_404(property_amenity_id)
            property_amenity_schema = PropertyAmenitySchema()
            return property_amenity_schema.dump(property_amenity), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def put(self, property_amenity_id):
        data = request.get_json()
        property_amenity_schema = PropertyAmenitySchema()

        try:
            property_amenity = PropertyAmenity.query.get_or_404(property_amenity_id)
            errors = property_amenity_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            for key, value in data.items():
                setattr(property_amenity, key, value)

            db.session.commit()
            return property_amenity_schema.dump(property_amenity), 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def delete(self, property_amenity_id):
        try:
            property_amenity = PropertyAmenity.query.get_or_404(property_amenity_id)
            db.session.delete(property_amenity)
            db.session.commit()
            return {"message": "Property Amenity deleted successfully"}, 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

class UnitAmenityList(Resource):
    @jwt_required()
    def get(self):
        try:
            unit_amenities = UnitAmenity.query.all()
            unit_amenity_schema = UnitAmenitySchema(many=True)
            return unit_amenity_schema.dump(unit_amenities), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def post(self):
        data = request.get_json()
        unit_amenity_schema = UnitAmenitySchema()

        try:
            errors = unit_amenity_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            unit_amenity = UnitAmenity(**data)
            db.session.add(unit_amenity)
            db.session.commit()
            return unit_amenity_schema.dump(unit_amenity), 201

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500


class UnitAmenityDetail(Resource):
    @jwt_required()
    def get(self, unit_amenity_id):
        try:
            unit_amenity = UnitAmenity.query.get_or_404(unit_amenity_id)
            unit_amenity_schema = UnitAmenitySchema()
            return unit_amenity_schema.dump(unit_amenity), 200
        except Exception as e:
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def put(self, unit_amenity_id):
        data = request.get_json()
        unit_amenity_schema = UnitAmenitySchema()

        try:
            unit_amenity = UnitAmenity.query.get_or_404(unit_amenity_id)
            errors = unit_amenity_schema.validate(data)
            if errors:
                return {"errors": errors}, 400

            for key, value in data.items():
                setattr(unit_amenity, key, value)

            db.session.commit()
            return unit_amenity_schema.dump(unit_amenity), 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500

    @jwt_required()
    def delete(self, unit_amenity_id):
        try:
            unit_amenity = UnitAmenity.query.get_or_404(unit_amenity_id)
            db.session.delete(unit_amenity)
            db.session.commit()
            return {"message": "Unit Amenity deleted successfully"}, 200

        except Exception as e:
            db.session.rollback()
            return {"message": f"An error occurred: {str(e)}"}, 500
