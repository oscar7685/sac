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
app.controller('crearCursoPCtrl', ["$scope", "CursoFactory", "$location", "SweetAlert",
    function ($scope, CursoFactory, $location, SweetAlert) {
        $scope.curso = {
            idcurso: "",
            aula: null,
            comandante: null,
            programa: {"idprograma": 2, "facultad": {"idfacultad": 4, "facultad": "FACULTAD DE CIENCIAS NAVALES Y NÁUTICAS"}},
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
                        CursoFactory.buscarB().$promise.then(function (cursosbase) {
                            if (angular.isArray(cursosbase)) {
                                cursosbase.forEach(function (cursobase) {
                                    $scope.cursoNuevo = angular.copy($scope.curso);
                                    $scope.cursoNuevo.codigo = cursobase.codigo;
                                    CursoFactory.save($scope.cursoNuevo).$promise.then(function () {
                                    });
                                });
                            }
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
                //$scope.data[i].numest = $scope.data[i].estudiantes.length; //set the data from nested obj into new property
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
app.controller('estudiantesCurso', ["$scope", "$filter", "$stateParams", "CursoFactory", "EstudianteFactory", "SweetAlert", function ($scope, $filter, $stateParams, CursoFactory, EstudianteFactory, SweetAlert) {
        CursoFactory.query().$promise.then(function (result) {
            $scope.cursosAnteriores = result;
            $scope.cursosActuales = angular.copy(result);
            $scope.estudiantesAnteriores = [];
            $scope.estudiantesActuales = [];
            $scope.cursoActualId = null;
            $scope.cursoAnteriorId = null;
            $scope.$watch('cursoAnterior.idcurso', function (newVal) {
                $scope.cursoAnteriorId = newVal;
                var i, res = [];
                if (newVal) {
                    EstudianteFactory.buscarC({idcurso: newVal}).$promise.then(function (result3) {
                        $scope.estudiantesAnteriores = result3;
                    });
                }
            });
            $scope.$watch('cursoActual.idcurso', function (newVal) {
                $scope.cursoActualId = newVal;
                var i, res = [];
                if (newVal) {
                    EstudianteFactory.buscarC({idcurso: newVal}).$promise.then(function (result4) {
                        $scope.estudiantesActuales = result4;
                    });
                }
            });
            $scope.valor = "";
            $scope.estudiantesSelected = [];
            $scope.estudiantesSelected2 = [];
            $scope.selectedIndex = [];
            $scope.selectedIndex2 = [];
            $scope.$watch('estudiantesAnteriores.codigo', function (newVal) {
                $scope.estudiantesSelected = [];
                $scope.selectedIndex = [];
                if (!newVal) {
                    // sometimes selected is null or undefined
                    return;
                }
                // here's the magic
                angular.forEach(newVal, function (val) {
                    $scope.estudiantesSelected.push(val);
                });
            });

            $scope.$watch('estudiantesActuales.codigo', function (newVal2) {
                $scope.estudiantesSelected2 = [];
                $scope.selectedIndex2 = [];
                if (!newVal2) {
                    // sometimes selected is null or undefined
                    return;
                }
                // here's the magic
                angular.forEach(newVal2, function (val2) {
                    $scope.estudiantesSelected2.push(val2);
                });
            });


            function arrayObjectIndexOf(arr, obj) {
                for (var i = 0; i < arr.length; i++) {
                    if (angular.equals(arr[i].codigo, obj)) {
                        return i;
                    }
                }
                ;
                return -1;
            }
            $scope.agregarEstudiante = function () {
                $scope.cursoActual1 = null;
                $scope.cursoAnterior1 = null;
                if ($scope.cursoActualId == null) {
                    SweetAlert.swal("Error de validación!", "Debe seleccionar el curso actual", "error");
                } else {
                    CursoFactory.get({idCurso: $scope.cursoActualId}).$promise.then(function (result) {
                        $scope.cursoActual1 = result;
                        CursoFactory.get({idCurso: $scope.cursoAnteriorId}).$promise.then(function (result2) {
                            $scope.cursoAnterior1 = result2;
                            if ($scope.cursoActual1.anio < $scope.cursoAnterior1.anio ||
                                    (($scope.cursoActual1.anio === $scope.cursoAnterior1.anio) && ($scope.cursoActual1.periodo <= $scope.cursoAnterior1.periodo)))
                            {
                                SweetAlert.swal("Error de validación!", "El periodo del curso actual debe ser superior al periodo del curso anterior", "error");
                            } else {
                                angular.forEach($scope.estudiantesSelected, function (value) {
                                    var index = arrayObjectIndexOf($scope.estudiantesAnteriores, value);
                                    if (index !== -1) {
                                        CursoFactory.insertarEstudiante({idCurso: $scope.cursoActualId, codigo: value}).$promise.then(function () {
                                            EstudianteFactory.buscarC({idcurso: $scope.cursoActualId}).$promise.then(function (result4) {
                                                $scope.estudiantesActuales = result4;
                                            });
                                            $scope.estudiantesAnteriores.splice(index, 1);
                                        });
                                    }
                                });
                            }
                        });
                    });
                }
            };
            $scope.agregarTodos = function () {
                $scope.cursoActual1 = null;
                $scope.cursoAnterior1 = null;
                if ($scope.cursoActualId == null) {
                    SweetAlert.swal("Error de validación!", "Debe seleccionar el curso actual", "error");
                } else {
                    CursoFactory.get({idCurso: $scope.cursoActualId}).$promise.then(function (result) {
                        $scope.cursoActual1 = result;
                        CursoFactory.get({idCurso: $scope.cursoAnteriorId}).$promise.then(function (result2) {
                            $scope.cursoAnterior1 = result2;
                            if ($scope.cursoActual1.anio < $scope.cursoAnterior1.anio ||
                                    (($scope.cursoActual1.anio === $scope.cursoAnterior1.anio) && ($scope.cursoActual1.periodo <= $scope.cursoAnterior1.periodo)))
                            {
                                SweetAlert.swal("Error de validación!", "El periodo del curso actual debe ser superior al periodo del curso anterior", "error");
                            } else {
                                angular.forEach($scope.estudiantesAnteriores, function (value) {
                                    CursoFactory.insertarEstudiante({idCurso: $scope.cursoActualId, codigo: value.codigo}).$promise.then(function () {
                                    });
                                });
                                $scope.estudiantesAnteriores.splice(0, $scope.estudiantesAnteriores.length);
                                EstudianteFactory.buscarC({idcurso: $scope.cursoActualId}).$promise.then(function (result4) {
                                    $scope.estudiantesActuales = result4;
                                });
                            }
                        });
                    });


                }
            };
            $scope.removerEstudiante = function () {
                $scope.cursoActual1 = null;
                CursoFactory.get({idCurso: $scope.cursoActualId}).$promise.then(function (result2) {
                    $scope.cursoActual1 = result2;
                    angular.forEach($scope.estudiantesSelected2, function (value) {
                        var index = arrayObjectIndexOf($scope.estudiantesActuales, value);
                        if (index !== -1) {
                            CursoFactory.eliminarEstudiante({idCurso: $scope.cursoActualId, codigo: value}).$promise.then(function () {
                                EstudianteFactory.buscarC({idcurso: $scope.cursoActualId}).$promise.then(function (result4) {
                                    $scope.estudiantesActuales = result4;
                                });
                                $scope.estudiantesActuales.splice(index, 1);
                            });
                        }
                    });

                });
            };

            $scope.removerTodos = function () {
                $scope.cursoActual1 = null;
                CursoFactory.get({idCurso: $scope.cursoActualId}).$promise.then(function (result2) {
                    $scope.cursoActual1 = result2;
                    angular.forEach($scope.estudiantesActuales, function (value) {

                        CursoFactory.eliminarEstudiante({idCurso: $scope.cursoActualId, codigo: value.codigo}).$promise.then(function () {
                            EstudianteFactory.buscarC({idcurso: $scope.cursoActualId}).$promise.then(function (result4) {
                                $scope.estudiantesActuales = result4;
                            });
                        });
                    });

                    $scope.estudiantesActuales.splice(0, $scope.estudiantesActuales.length);

                });
            };



        });
    }]);

