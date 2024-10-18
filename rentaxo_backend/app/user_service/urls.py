from .views import *

def register_routes(app):
    # Register the UserAPI and PostAPI as class-based views
    app.add_url_rule('/api/v1/user/register', view_func=UserRegistration.as_view('register'))
    app.add_url_rule('/api/v1/user/login', view_func=UserLogin.as_view('login'))

    app.add_url_rule('/api/v1/manager_list', view_func=ManagerList.as_view('manager_list'))
    app.add_url_rule('/api/v1/manager_detail/<int:manager_id>', view_func=ManagerDetail.as_view('manager_detail'))

    app.add_url_rule('/api/v1/tenant_list', view_func=TenantList.as_view('tenant_list'))
    app.add_url_rule('/api/v1/tenant_detail/<int:tenant_id>', view_func=TenantDetail.as_view('tenant_detail'))

    app.add_url_rule('/api/v1/property_list', view_func=PropertyList.as_view('property_list'))
    app.add_url_rule('/api/v1/property_detail/<int:property_id>', view_func=PropertyDetail.as_view('property_detail'))

    app.add_url_rule('/api/v1/unit_list', view_func=UnitList.as_view('unit_list'))
    app.add_url_rule('/api/v1/unit_detail/<int:unit_id>', view_func=UnitDetail.as_view('unit_detail'))
