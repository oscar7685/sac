'use strict';
/**
 * controllers for ng-table
 * Simple table with sorting and filtering on AngularJS
 */

app.controller('listAsignaturas', ["$scope", "$filter", "ngTableParams", "AsignaturaFactory",
    function ($scope, $filter, ngTableParams, AsignaturaFactory) {
        AsignaturaFactory.query().$promise.then(function (datos) {
            $scope.data = datos;
            for (var i = 0; i < $scope.data.length; i++) {
                $scope.data[i].progaux = ""; //initialization of new property 
                $scope.data[i].progaux = $scope.data[i].programaByProgramaIdprograma.nombre;  //set the data from nested obj into new property
                $scope.data[i].horas = $scope.data[i].creditos * 48;
            }
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
app.filter('exclude', function () {
    return function (items, exclude) {
        return items.filter(function (item) {
            return exclude.indexOf(item.idprograma) === -1;
        });
    };
});
app.controller('crearAsignaturaCtrl', ["$scope", "AsignaturaFactory", "$location", "SweetAlert", "ProgramaFactory",
    function ($scope, AsignaturaFactory, $location, SweetAlert, ProgramaFactory) {
        ProgramaFactory.query().$promise.then(function (result) {
            $scope.programas = result;
            $scope.asignatura = {
                idasignatura: "",
                nombre: "",
                codigo: "",
                creditos: "",
                semestre: "",
                ubicacion: "",
                programaByProgramaIdprograma: {
                    idprograma: "",
                    nombre: "",
                    modalidad: ""
                },
                tipo: "",
                programaByProgramaEspecialidad: null
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
                            AsignaturaFactory.save($scope.asignatura).$promise.then(function () {
                                $location.path("app/asignaturas/listar");
                            }, function (bussinessMessages) {
                                $scope.bussinessMessages = bussinessMessages;
                            });
                            // SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                        }
                    }
                },
                reset: function (form) {
                    $scope.asignatura = angular.copy($scope.master);
                    form.$setPristine(true);
                }
            };
        });


    }]);
app.controller('editarAsignaturaCtrl', ["$scope", "$state", "$stateParams", "AsignaturaFactory", "ProgramaFactory", "$location", "SweetAlert",
    function ($scope, $state, $stateParams, AsignaturaFactory, ProgramaFactory, $location, SweetAlert) {
        ProgramaFactory.query().$promise.then(function (result0) {
            $scope.programas = result0;
            AsignaturaFactory.get({idAsignatura: $stateParams.idasignatura}).$promise.then(function (result) {
                $scope.asignatura = result;
                $scope.master = angular.copy($scope.asignatura);
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
                            AsignaturaFactory.update({idAsignatura: $scope.asignatura.idasignatura}, $scope.asignatura).$promise.then(function () {
                                $location.path("app/asignaturas/listar");
                            }, function (bussinessMessages) {
                                $scope.bussinessMessages = bussinessMessages;
                            });
                            //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                        }
                    }
                },
                reset: function (form) {
                    $scope.asignatura = angular.copy($scope.master);
                    form.$setPristine(true);
                }
            };
        });
    }]);
