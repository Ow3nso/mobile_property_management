import enum

class UserRole(enum.Enum):
    TENANT = "TENANT"
    MANAGER = "MANAGER"

class PropertyType(enum.Enum):
    HOUSE = "HOUSE"
    APARTMENT = "APARTMENT"
    VILLA = "VILLA"
    MALL = "MALL"

class UnitType(enum.Enum):
    STUDIO = "STUDIO"
    NON_STUDIO = "NON STUDIO"

class LeaseStatus(enum.Enum):
    ACTIVE = "ACTIVE"
    TERMINATED = "TERMINATED"
    EXPIRED = "EXPIRED"