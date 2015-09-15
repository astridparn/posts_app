angular.module "postsAppb"
  .factory 'RolesService', ($auth) ->
    adminRoles = [
      'admin'
    ]
    userRoles = [
      'registered'
      'admin'
    ]
    userRoleIn = (roles) ->
      $auth.validateUser().then((user) ->
        roles.indexOf(user.role.name) > -1
      ).catch ->
        false

    isAdmin: ->
      userRoleIn adminRoles
    isUser: ->
      userRoleIn userRoles
