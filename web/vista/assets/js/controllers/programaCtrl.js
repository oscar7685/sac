'use strict';
/**
 * controllers for ng-table
 * Simple table with sorting and filtering on AngularJS
 */

app.controller('listProgramas', ["$scope", "$filter", "ngTableParams", "ProgramaFactory",
    function ($scope, $filter, ngTableParams, ProgramaFactory) {
        ProgramaFactory.query().$promise.then(function (datos) {
            $scope.data = datos;
            $scope.tableParams = new ngTableParams({
                page: 1, // show first page
                count: 10, // count per page
                sorting: {
                    name: 'asc' // initial sorting
                }
            }, {
                total: $scope.data.length, // length of dataEdificios
                getData: function ($defer, params) {
                    //sorting
                    var orderedData = params.sorting() ? $filter('orderBy')($scope.data, params.orderBy()) : $scope.data;

                    //filtering
                    orderedData = $filter('filter')(orderedData, params.filter());
                    $scope.aux = orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count());

                    //pagination
                    params.total(orderedData.length);
                    $defer.resolve($scope.aux);
                }
            });
        });

    }]);
app.controller('crearProgramaCtrl', ["$scope", "ProgramaFactory", "$location", "SweetAlert", "FacultadFactory",
    function ($scope, ProgramaFactory, $location, SweetAlert, FacultadFactory) {
        FacultadFactory.query().$promise.then(function (result) {
            $scope.facultades = result;
            $scope.programa = {
                idprograma: "",
                nombre: "",
                modalidad: "",
                nivelFormacion: "",
                facultad: {
                    idfacultad: "",
                    facultad: ""
                }
            };
            $scope.master = angular.copy($scope.programa);
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
                            ProgramaFactory.save($scope.programa).$promise.then(function () {
                                $location.path("app/programas/listar");
                            }, function (bussinessMessages) {
                                $scope.bussinessMessages = bussinessMessages;
                            });
                            // SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                        }
                    }
                },
                reset: function (form) {
                    $scope.programa = angular.copy($scope.master);
                    form.$setPristine(true);
                }
            };
        });


    }]);
app.controller('editarProgramaCtrl', ["$scope", "$state", "$stateParams", "ProgramaFactory", "$location", "SweetAlert",
    function ($scope, $state, $stateParams, ProgramaFactory, $location, SweetAlert) {
        ProgramaFactory.get({idPrograma: $stateParams.idprograma}).$promise.then(function (result) {
            $scope.programa = result;
            $scope.master = angular.copy($scope.programa);
        });
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

                        ProgramaFactory.update({idPrograma: $scope.programa.idprograma}, $scope.programa).$promise.then(function () {
                            $location.path("app/programas/listar");
                        }, function (bussinessMessages) {
                            $scope.bussinessMessages = bussinessMessages;
                        });
                        //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                    }
                }
            },
            reset: function (form) {
                $scope.programa = angular.copy($scope.master);
                form.$setPristine(true);
            }
        };
    }]);
