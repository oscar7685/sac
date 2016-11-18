/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
app.controller('loginCtrl', ["$rootScope", "$scope", "UsuarioFactory", "$location", "SweetAlert", function ($rootScope, $scope, UsuarioFactory, $location, SweetAlert) {
        $scope.usuario = {
            usuario: "",
            password: ""
        };
        var authenticate = function (credentials, callback) {
            UsuarioFactory.login(credentials).$promise.then(function (data) {
                if (data.usuario) {
                    $rootScope.authenticated = true;
                } else {
                    $rootScope.authenticated = false;
                }
                callback && callback();
            }, function (bussinessMessages) {
                $rootScope.authenticated = false;
                callback && callback();
            });

        }
        authenticate();
        $scope.form = {
            submit: function (form) {
                var firstError = null;
                if (form.$invalid) {
                    var field = null, firstError = null;
                    for (field in form) {
                        if (field[0] != '$') {
                            if (firstError === null && !form[field].$valid) {
                                firstError = form[field].$name;
                            }

                            if (form[field].$pristine) {
                                form[field].$dirty = true;
                            }
                        }
                    }
                    angular.element('.ng-invalid[name=' + firstError + ']').focus();
                    SweetAlert.swal("The form cannot be submitted because it contains validation errors!", "Errors are marked with a red, dashed border!", "error");
                    return;
                } else {
                    if (form.$valid) {
                        //console.log("$rootScope.authenticated: "+$rootScope.authenticated);
                        authenticate($scope.usuario, function () {
                            if ($rootScope.authenticated) {
                                $location.path("/app/dashboard");
                                //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                            } else {
                                $location.path("/login/signin");
                            }
                        });
                    }
                }

            }
        };

    }]);