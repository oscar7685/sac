/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

app.controller('crearRolCtrl', ["$scope", "RolFactory", "PermisoFactory", "$location", "SweetAlert", "$filter", function ($scope, RolFactory, PermisoFactory, $location, SweetAlert, $filter) {
        PermisoFactory.query().$promise.then(function (result) {
            $scope.permisos = result;
            $scope.rol = {
                codigo: null,
                descripcion: "",
                permisoses: []
            };
            $scope.playList1= [];
            $scope.seleccionados = function () {
                $scope.playList1 = $filter('filter')($scope.permisos, {checked: true});
            }
            $scope.master = angular.copy($scope.rol);
            $scope.master2 = angular.copy($scope.permisos);
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
                            for (var i = 0; i < $scope.playList1.length; i++) {
                                $scope.rol.permisoses.push({'idpermisos': $scope.playList1[i]['idpermisos'], 'descripcion': $scope.playList1[i]['descripcion']});
                            }
                            RolFactory.save($scope.rol).$promise.then(function () {
                                $location.path("app/rol/listar");
                            }, function (bussinessMessages) {
                                $scope.bussinessMessages = bussinessMessages;
                            });
                            SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                        }
                    }

                },
                reset: function (form) {
                    $scope.rol = angular.copy($scope.master);
                    $scope.permisos = angular.copy($scope.master2);

                    form.$setPristine(true);
                }
            };
        });
    }]);
app.controller('editarRolCtrl', ["$scope", "$state", "$stateParams", "RolFactory", "PermisoFactory", "$location", "SweetAlert", "$filter",
    function ($scope, $state, $stateParams, RolFactory, PermisoFactory, $location, SweetAlert, $filter) {
        RolFactory.get({idRol: $stateParams.idrol}).$promise.then(function (result) {
            $scope.rol = result;
            PermisoFactory.query().$promise.then(function (result2) {
                $scope.permisos = result2;
                $scope.containsObject = function (obj, list) {
                    var i;
                    for (i = 0; i < list.length; i++) {
                        if (list[i].idpermisos === obj.idpermisos) {
                            return true;
                        }
                    }
                    return false;
                }
                for (var i = 0; i < $scope.permisos.length; i++) {
                    if ($scope.containsObject($scope.permisos[i],$scope.rol.permisoses)) {
                        $scope.permisos[i].checked = true;
                    }else{
                        $scope.permisos[i].checked = false;
                    }
                }
                $scope.seleccionados = function () {
                    $scope.playList = $filter('filter')($scope.permisos, {checked: true});
                }
                $scope.seleccionados();
                $scope.master = angular.copy($scope.rol);
                $scope.master2 = angular.copy($scope.permisos);

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
                            SweetAlert.swal("El formulario no puede ser enviado porque contiene errores de validación!", "Los errores estan resaltados con color rojo!", "error");
                            return;
                        } else {
                            if (form.$valid) {
                                $scope.rol.permisoses = [];
                                for (var i = 0; i < $scope.playList.length; i++) {
                                    $scope.rol.permisoses.push({'idpermisos': $scope.playList[i]['idpermisos'], 'descripcion': $scope.playList[i]['descripcion']});
                                }
                                RolFactory.update({idRol: $scope.rol.codigo}, $scope.rol).$promise.then(function () {
                                    $location.path("app/roles/listar");
                                }, function (bussinessMessages) {
                                    $scope.bussinessMessages = bussinessMessages;
                                });
                                //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                            }
                        }

                    },
                    reset: function (form) {
                        $scope.rol = angular.copy($scope.master);
                        $scope.permisos = angular.copy($scope.master2);
                        form.$setPristine(true);
                    }
                };
            });
        });
    }]);
app.controller('tablaRolCtrl', ["$scope", "$filter", "RolFactory", "ngTableParams", function ($scope, $filter, RolFactory, ngTableParams) {
        RolFactory.query().$promise.then(function (result) {
            $scope.data = result;
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