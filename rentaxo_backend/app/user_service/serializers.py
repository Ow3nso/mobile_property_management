from marshmallow import Schema, fields, post_load, validate, ValidationError
from werkzeug.security import generate_password_hash
from datetime import datetime

# ---------- Serializers ----------

class UserSchema(Schema):
    id = fields.Int(dump_only=True)
    full_name = fields.Str(required=True, validate=validate.Length(max=50))
    email = fields.Email(required=True)
    phone_number = fields.Str(required=True, validate=validate.Length(max=20))
    password = fields.Str(required=True, load_only=True)  
    role = fields.Str(required=True)  
    created_at = fields.DateTime(dump_only=True)
    updated_at = fields.DateTime(dump_only=True)

    @post_load
    def hash_password(self, data, **kwargs):
        if 'password' in data:
            data['password_hash'] = generate_password_hash(data['password'])
            del data['password']  
        return data

class ManagerSchema(Schema):
    id = fields.Int(dump_only=True)
    user = fields.Nested(UserSchema)  
    properties = fields.Nested('PropertySchema', many=True, dump_only=True)

    class Meta:
        fields = ('id', 'user', 'properties')

class TenantSchema(Schema):
    id = fields.Int(dump_only=True)
    user = fields.Nested(UserSchema)  
    leases = fields.Nested('LeaseSchema', many=True, dump_only=True)

class PropertySchema(Schema):
    id = fields.Int(dump_only=True)
    name = fields.Str(required=True, validate=validate.Length(max=100))
    description = fields.Str()
    address = fields.Str(required=True, validate=validate.Length(max=250))
    property_type = fields.Str(required=True)
    num_units = fields.Int(default=1)
    manager = fields.Int(required=True)
    amenities = fields.Nested('PropertyAmenitySchema', many=True, dump_only=True)
    units = fields.Nested('UnitSchema', many=True, dump_only=True)

class UnitSchema(Schema):
    id = fields.Int(dump_only=True)
    unit_number = fields.Str(required=True, validate=validate.Length(max=50))
    unit_type = fields.Str(required=True)  
    floor = fields.Str(validate=validate.Length(max=10))
    num_bedrooms = fields.Int(required=True)
    rent_amount = fields.Float(required=True)
    is_occupied = fields.Bool(default=False)
    property_id = fields.Int(required=True)
    amenities = fields.Nested('UnitAmenitySchema', many=True, dump_only=True)
    leases = fields.Nested('LeaseSchema', many=True, dump_only=True)

class LeaseSchema(Schema):
    id = fields.Int(dump_only=True)
    start_date = fields.Date(required=True)
    end_date = fields.Date(required=True)
    rent_due_date = fields.Date(required=True)
    status = fields.Str(required=True, validate=validate.OneOf(["ACTIVE", "EXPIRED", "TERMINATED"])) 
    tenant_id = fields.Int(required=True)
    unit_id = fields.Int(required=True)

class AmenitySchema(Schema):
    id = fields.Int(dump_only=True)
    name = fields.Str(required=True, validate=validate.Length(max=100))
    description = fields.Str()

class PropertyAmenitySchema(Schema):
    id = fields.Int(dump_only=True)
    property_id = fields.Int(required=True)
    amenity_id = fields.Int(required=True)

class UnitAmenitySchema(Schema):
    id = fields.Int(dump_only=True)
    unit_id = fields.Int(required=True)
    amenity_id = fields.Int(required=True)
