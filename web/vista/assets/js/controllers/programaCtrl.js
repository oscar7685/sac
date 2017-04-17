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

app.controller('editarProgramaCtrl', ["$scope", "ngTableParams", "$state", "$stateParams", "ProgramaFactory", "FacultadFactory", "AsignaturaFactory", "$location", "SweetAlert", "$filter",
    function ($scope, $state, ngTableParams, $stateParams, ProgramaFactory, FacultadFactory, AsignaturaFactory, $location, SweetAlert, $filter) {
        var filteredData = [];
        var orderedData = [];
        $scope.maxSemestre = 2;
        $scope.asignaturas = [];
        $scope.facultades = [];
        FacultadFactory.query().$promise.then(function (result0) {
            $scope.facultades = result0;
            AsignaturaFactory.buscarA({idprograma: $stateParams.idprograma}).$promise.then(function (result3) {
                ProgramaFactory.get({idPrograma: $stateParams.idprograma}).$promise.then(function (result) {
                    $scope.programa = result;
                    $scope.master = angular.copy($scope.programa);
                });
                $scope.asignaturas = result3;
                var expression = {
                    programaByProgramaEspecialidad: {
                        idprograma: ''
                    }
                }

                var lookup = {};
                $scope.result = [];
                var asigEsp = $filter('filter')($scope.asignaturas, expression);
                for (var i = 0; i < asigEsp.length; i++) {
                    var name = asigEsp[i].programaByProgramaEspecialidad.idprograma;
                    if (!(name in lookup)) {
                        lookup[name] = 1;
                        $scope.result.push(name);
                    }
                }
                for (var i = 0; i < $scope.asignaturas.length; i++) {
                    if ($scope.asignaturas[i].semestre > $scope.maxSemestre) {
                        $scope.maxSemestre = $scope.asignaturas[i].semestre;
                    }
                }
                $scope.tableParams2 = new ngTableParams({
                    page: 1, // show first page
                    count: 20, // count per page
                    sorting: {
                        name: 'asc' // initial sorting
                    }
                }, {
                    total: $scope.asignaturas.length,
                    getData: function ($defer, params) {
                        //sorting
                        var orderedData = params.sorting() ? $filter('orderBy')($scope.asignaturas, params.orderBy()) : $scope.asignaturas;
                        //filtering
                        orderedData = $filter('filter')(orderedData, params.filter());
                        $scope.aux = orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count());
                        //pagination
                        params.total(orderedData.length);
                        $defer.resolve($scope.aux);
                    }
                });
            }
            );
            $scope.getNumber = function (num) {
                return new Array(num);
            };
            $scope.getTotal = function (sem) {
                var materias = $filter('filter')($scope.asignaturas, {semestre: '' + sem});
                var totalx = 0;
                for (var i = 0; i < materias.length; i++) {
                    totalx += materias[i].creditos;
                }
                return "" + totalx;
            };
            $scope.getTitulo = function (num) {
                var prefijo = "";
                if (num === 0) {
                    prefijo = "Primer";
                } else if (num === 1) {
                    prefijo = "Segundo";
                } else if (num === 2) {
                    prefijo = "Tercer";
                } else if (num === 3) {
                    prefijo = "Cuarto";
                } else if (num === 4) {
                    prefijo = "Quinto";
                } else if (num === 5) {
                    prefijo = "Sexto";
                } else if (num === 6) {
                    prefijo = "Septimo";
                } else if (num === 7) {
                    prefijo = "Octavo";
                } else if (num === 8) {
                    prefijo = "Noveno";
                } else if (num === 9) {
                    prefijo = "Decimo";
                }
                return prefijo + " semestre";
            };
            $scope.getAsignaturas = function (sem) {
                orderedData = $filter('filter')($scope.asignaturas, {semestre: '' + sem});
                return orderedData.length;
            };
            $scope.getCreditos = function (sem) {
                filteredData = $filter('filter')($scope.asignaturas, {semestre: '' + sem});
                var creditos = 0;
                for (var i = 0; i < filteredData.length; i++) {
                    creditos += filteredData[i].creditos;
                }
                return creditos;
            };
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
            }
            ;
        });
    }
]);
