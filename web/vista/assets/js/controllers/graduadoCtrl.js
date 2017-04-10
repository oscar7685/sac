/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


app.controller('crearGraduadoCtrl2', ["$scope", "GraduadoFactory", "ProgramaFactory", "$location", "SweetAlert",
    function ($scope, GraduadoFactory, ProgramaFactory, $location, SweetAlert) {
        $scope.format = 'dd-MM-yyyy';
        $scope.maxDate = new Date();
        $scope.graduadoEstado = true;
        $scope.$watch('graduado.estado', function (newValue, oldValue) {
            console.log()
            if (newValue === 'GRADUADO') {
                $scope.graduadoEstado = false;
            } else {
                $scope.graduadoEstado = true;
            }
        });
        $scope.open = function ($event) {
            $event.preventDefault();
            $event.stopPropagation();
            $scope.opened = !$scope.opened;
        };

        $scope.dateOptions = {
            formatYear: 'yy',
            startingDay: 1
        };
        $scope.graduado = {
            idgraduado: "",
            programa: "",
            primerNombre: "",
            segundoNombre: "",
            primerApellido: "",
            segundoApellido: "",
            tipoId: "",
            numeroId: "",
            categoria: "",
            estado: "",
            fechaGrado: "",
            correoElectronico: "",
            celular: "",
            direccion: "",
            empresaDondeLabora: "",
            cargo: ""
        };

        ProgramaFactory.query().$promise.then(function (result) {
            $scope.programas = result;
            $scope.master = angular.copy($scope.graduado);
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
                            GraduadoFactory.save($scope.graduado).$promise.then(function () {
                                $location.path("app/graduados/listar");
                            }, function (bussinessMessages) {
                                $scope.bussinessMessages = bussinessMessages;
                            });
                            //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                        }
                    }

                },
                reset: function (form) {
                    $scope.graduado = angular.copy($scope.master);
                    form.$setPristine(true);
                }
            };
        });
    }]);


app.controller('editarGraduadoCtrl2', ["$scope", "$state", "$stateParams", "GraduadoFactory", "ProgramaFactory", "$location", "SweetAlert",
    function ($scope, $state, $stateParams, GraduadoFactory, ProgramaFactory, $location, SweetAlert) {
        GraduadoFactory.get({idGraduado: $stateParams.idgraduado}).$promise.then(function (result) {
            $scope.graduado = result;
            $scope.master = angular.copy($scope.graduado);
            ProgramaFactory.query().$promise.then(function (result2) {
                $scope.programas = result2;
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

                                GraduadoFactory.update({idGraduado: $scope.graduado.idgraduado}, $scope.graduado).$promise.then(function () {
                                    $location.path("app/graduados/listar");
                                }, function (bussinessMessages) {
                                    $scope.bussinessMessages = bussinessMessages;
                                });
                                //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                            }
                        }

                    },
                    reset: function (form) {
                        $scope.graduado = angular.copy($scope.master);
                        form.$setPristine(true);
                    }
                };
            });


        });
    }]);


app.controller('tablaGraduadosCtrl', ["$scope", "$filter", "GraduadoFactory", "ngTableParams", function ($scope, $filter, GraduadoFactory, ngTableParams) {
        GraduadoFactory.query().$promise.then(function (result) {
            $scope.data = result;
            for (var i = 0; i < $scope.data.length; i++) {
                $scope.data[i].progaux = ""; //initialization of new property 
                $scope.data[i].progaux = $scope.data[i].programa.nombre;  //set the data from nested obj into new property
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