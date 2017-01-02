'use strict';
/**
 * controllers for ng-table
 * Simple table with sorting and filtering on AngularJS
 */

app.controller('aulasCtrl', ["$scope", "$filter", "ngTableParams", "AulaFactory", function ($scope, $filter, ngTableParams, AulaFactory) {
        AulaFactory.query().$promise.then(function (datos) {
            $scope.data = datos;
            for (var i = 0; i < $scope.data.length; i++) {
                $scope.data[i].edifaux = ""; //initialization of new property 
                $scope.data[i].edifaux = $scope.data[i].edificio.nombre;  //set the data from nested obj into new property
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
app.controller('crearAulaCtrl2', ["$scope", "AulaFactory", "EdificioFactory", "$location", "SweetAlert", function ($scope, AulaFactory, EdificioFactory, $location, SweetAlert) {
        EdificioFactory.query().$promise.then(function (result) {

            $scope.edificios = result;
            $scope.aula = {
                idaula: "",
                edificio: {
                    idedificio: "",
                    nombre: "",
                    pisos: ""
                },
                nombre: "",
                tipo: "",
                capacidad: "",
                estado: "",
                capacidadAudiovisual: "",
                tablero: "",
                videoBeam: "",
                tv: "",
                piso: ""
            };
            $scope.pisosActuales = [];
            $scope.$watch('aula.edificio.idedificio', function (newVal) {
                var i, res = [];
                if (newVal) {
                    EdificioFactory.get({idEdificio: newVal}).$promise.then(function (result) {
                        for (i = 1; i <= result.pisos; i++) {
                            res.push(i);
                        }
                        $scope.pisosActuales = res;
                    });
                }
            });
            $scope.master = angular.copy($scope.aula);
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
                            AulaFactory.save($scope.aula).$promise.then(function () {
                                $location.path("app/aulas/listar");
                            }, function (bussinessMessages) {
                                $scope.bussinessMessages = bussinessMessages;
                            });
                            // SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                        }
                    }

                },
                reset: function (form) {
                    $scope.aula = angular.copy($scope.master);
                    form.$setPristine(true);
                }
            };
        });
    }]);
app.controller('editarAulaCtrl2', ["$scope", "$state", "$stateParams", "AulaFactory", "EdificioFactory", "$location", "SweetAlert",
    function ($scope, $state, $stateParams, AulaFactory, EdificioFactory, $location, SweetAlert) {
        AulaFactory.get({idAula: $stateParams.idaula}).$promise.then(function (result) {
            $scope.aula = result;
            $scope.master = angular.copy($scope.aula);
            EdificioFactory.query().$promise.then(function (result2) {
                $scope.edificios = result2;
                $scope.pisosActuales = [];
                $scope.$watch('aula.edificio.idedificio', function (newVal) {
                    var i, res = [];
                    if (newVal) {
                        EdificioFactory.get({idEdificio: newVal}).$promise.then(function (result3) {
                            for (i = 1; i <= result3.pisos; i++) {
                                res.push(i);
                            }
                            $scope.pisosActuales = res;
                        });
                    }
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

                                AulaFactory.update({idAula: $scope.aula.idaula}, $scope.aula).$promise.then(function () {
                                    $location.path("app/aulas/listar");
                                }, function (bussinessMessages) {
                                    $scope.bussinessMessages = bussinessMessages;
                                });
                                //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                            }
                        }

                    },
                    reset: function (form) {
                        $scope.aula = angular.copy($scope.master);
                        form.$setPristine(true);
                    }
                };
            });
        });
    }]);
