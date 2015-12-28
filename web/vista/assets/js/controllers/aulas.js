'use strict';
/**
 * controllers for ng-table
 * Simple table with sorting and filtering on AngularJS
 */

app.controller('aulasCtrl', ["$scope", "$filter", "$http", "ngTableParams", function ($scope, $filter, $http, ngTableParams) {
        $http({
            method: 'GET',
            url: '/sac/api/Aula'
        }).success(function (datos, status, headers, config) {
            $scope.data = datos;
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
        }).error(function (data, status, headers, config) {
            alert("Ha fallado la petición. Estado HTTP:" + status);
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
                        SweetAlert.swal("The form cannot be submitted because it contains validation errors!", "Errors are marked with a red, dashed border!", "error");
                        return;
                    } else {
                        if (form.$valid) {
                            AulaFactory.save($scope.aula).$promise.then(function () {
                                $location.path("app/aulas/listar");
                            }, function (bussinessMessages) {
                                $scope.bussinessMessages = bussinessMessages;
                            });
                            SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
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
                            SweetAlert.swal("The form cannot be submitted because it contains validation errors!", "Errors are marked with a red, dashed border!", "error");
                            return;
                        } else {
                            if (form.$valid) {

                                AulaFactory.update({idAula: $scope.aula.idaula}, $scope.aula).$promise.then(function () {
                                    $location.path("app/aulas/listar");
                                }, function (bussinessMessages) {
                                    $scope.bussinessMessages = bussinessMessages;
                                });
                                SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
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
