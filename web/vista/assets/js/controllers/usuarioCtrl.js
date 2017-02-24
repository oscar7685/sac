/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


app.controller('crearUsuarioCtrl', ["$scope", "UsuarioFactory", "RolFactory", "$location", "SweetAlert", function ($scope, UsuarioFactory, RolFactory, $location, SweetAlert) {
        RolFactory.query().$promise.then(function (result) {
            $scope.roles = result;
            $scope.usuario = {
                usuario: "",
                nombre: "",
                apellido: "",
                password: "",
                estado: "Activo",
                rol: {
                    codigo: "",
                    descripcion: ""
                }
            };
            $scope.master = angular.copy($scope.usuario);
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
                            UsuarioFactory.save($scope.usuario).$promise.then(function () {
                                $location.path("app/usuario/listar");
                            }, function (bussinessMessages) {
                                $scope.bussinessMessages = bussinessMessages;
                            });
                            SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                        }
                    }

                },
                reset: function (form) {
                    $scope.usuario = angular.copy($scope.master);
                    form.$setPristine(true);
                }
            };
        });
    }]);


app.controller('editarUsuarioCtrl', ["$scope", "$state", "$stateParams", "UsuarioFactory", "RolFactory", "$location", "SweetAlert",
    function ($scope, $state, $stateParams, UsuarioFactory, RolFactory, $location, SweetAlert) {
        UsuarioFactory.get({idUsuario: $stateParams.idusuario}).$promise.then(function (result) {
            $scope.usuario = result;

            RolFactory.query().$promise.then(function (result2) {
                $scope.roles = result2;
                $scope.master = angular.copy($scope.usuario);
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

                                UsuarioFactory.update({idUsuario: $scope.usuario.idusuario}, $scope.usuario).$promise.then(function () {
                                    $location.path("app/usuario/listar");
                                }, function (bussinessMessages) {
                                    $scope.bussinessMessages = bussinessMessages;
                                });
                                SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                            }
                        }

                    },
                    reset: function (form) {
                        $scope.usuario = angular.copy($scope.master);
                        form.$setPristine(true);
                    }
                };
            });


        });
    }]);


app.controller('tablaUsuarioCtrl', ["$scope", "$filter", "UsuarioFactory", "ngTableParams", function ($scope, $filter, UsuarioFactory, ngTableParams) {
        UsuarioFactory.query().$promise.then(function (result) {
            $scope.data = result;
            for (var i = 0; i < $scope.data.length; i++) {
                $scope.data[i].rolaux = ""; //initialization of new property 
                $scope.data[i].rolaux = $scope.data[i].rol.descripcion;  //set the data from nested obj into new property
            }
            $scope.tableParams = new ngTableParams({
                page: 1, // show first page
                count: 5, // count per page
                sorting: {
                    name: 'asc' // initial sorting
                }
            }, {
                total: $scope.data.length, // length of dataEdificios
                getData: function ($defer, params) {
                    // use build-in angular filter
                    var filteredData = params.sorting() ? $filter('orderBy')($scope.data, params.orderBy()) : $scope.data;
                    var orderedData = $filter('filter')(filteredData, params.filter());
                    $scope.aux = orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count());
                    params.total(orderedData.length);
                    // set total for recalc pagination
                    $defer.resolve($scope.aux);
                }
            });
        });
    }]);