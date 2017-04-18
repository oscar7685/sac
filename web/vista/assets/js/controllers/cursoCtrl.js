/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


app.controller('crearCursoCtrl2', ["$scope", "CursoFactory", "AulaFactory", "ProgramaFactory", "$location", "SweetAlert",
    function ($scope, CursoFactory, AulaFactory, ProgramaFactory, $location, SweetAlert) {
        AulaFactory.query().$promise.then(function (resultA) {
            $scope.aulas = resultA;
            ProgramaFactory.query().$promise.then(function (resultP) {
                $scope.programas = resultP;
                $scope.curso = {
                    idcurso: "",
                    aula: "",
                    comandante: null,
                    programa: "",
                    anio: "",
                    periodo: "",
                    codigo: ""
                };
                $scope.master = angular.copy($scope.curso);
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
                                CursoFactory.save($scope.curso).$promise.then(function () {
                                    $location.path("app/cursos/listar");
                                }, function (bussinessMessages) {
                                    $scope.bussinessMessages = bussinessMessages;
                                });
                                //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                            }
                        }

                    },
                    reset: function (form) {
                        $scope.curso = angular.copy($scope.master);
                        form.$setPristine(true);
                    }
                };
            });
        });
    }]);
app.controller('editarCursoCtrl2', ["$scope", "$state", "$stateParams", "CursoFactory", "AulaFactory", "ProgramaFactory", "EstudianteFactory", "$location", "SweetAlert",
    function ($scope, $state, $stateParams, CursoFactory, AulaFactory, ProgramaFactory, EstudianteFactory, $location, SweetAlert) {
        $scope.aux = null;
        AulaFactory.query().$promise.then(function (resultA) {
            $scope.aulas = resultA;
            ProgramaFactory.query().$promise.then(function (resultP) {
                $scope.programas = resultP;
                EstudianteFactory.buscarC({idcurso: $stateParams.idcurso}).$promise.then(function (result3) {
                    $scope.estudiantes = result3;
                    CursoFactory.get({idCurso: $stateParams.idcurso}).$promise.then(function (result) {
                        $scope.curso = result;
                        if ($scope.curso.comandante !== null) {
                            $scope.aux = $scope.curso.comandante;
                        }
                        $scope.master = angular.copy($scope.curso);
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
                                        $scope.curso.comandante = $scope.aux;
                                        CursoFactory.update({idCurso: $scope.curso.idcurso}, $scope.curso).$promise.then(function () {
                                            $location.path("app/cursos/listar");
                                        }, function (bussinessMessages) {
                                            $scope.bussinessMessages = bussinessMessages;
                                        });
                                        //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                                    }
                                }

                            },
                            reset: function (form) {
                                $scope.curso = angular.copy($scope.master);
                                form.$setPristine(true);
                            }
                        };
                    });
                });
            });
        });
    }]);
app.controller('tablaCursoCtrl', ["$scope", "$filter", "CursoFactory", "ngTableParams", function ($scope, $filter, CursoFactory, ngTableParams) {
        CursoFactory.query().$promise.then(function (result) {
            $scope.data = result;
            for (var i = 0; i < $scope.data.length; i++) {
                $scope.data[i].numest = ""; //initialization of new property 
                $scope.data[i].numest = $scope.data[i].estudiantes.length;  //set the data from nested obj into new property
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