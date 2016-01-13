'use strict';
/**
 * controllers for ng-table
 * Simple table with sorting and filtering on AngularJS
 */

app.filter("jsDate", function () {
    return function (x) {
        var d = new Date(parseInt(x.substr(6)));
        console.log("d: " + d);
        return d;
    };
});
app.controller('tablaSolicitudesCtrl', ["$scope", "$filter", "SolicitudFactory", "AulaFactory", "UsuarioFactory", "$location", "SweetAlert", "ngTableParams",
    function ($scope, $filter, SolicitudFactory, AulaFactory, UsuarioFactory, $location, SweetAlert, ngTableParams) {
        SolicitudFactory.query().$promise.then(function (result) {
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
app.controller('solicitarMantenimientoCtrl2', ["$scope", "SolicitudFactory", "AulaFactory", "UsuarioFactory", "$location", "SweetAlert", "FileUploader",
    function ($scope, SolicitudFactory, AulaFactory, UsuarioFactory, $location, SweetAlert, FileUploader) {

        var uploaderImages = $scope.uploaderImages = new FileUploader({
            url: '/sac/SubirArchivo'
        });
        // FILTERS

        uploaderImages.filters.push({
            name: 'imageFilter',
            fn: function (item/*{File|FileLikeObject}*/, options) {
                return this.queue.length < 5;
            }
        });
        // CALLBACKS

        uploaderImages.onWhenAddingFileFailed = function (item/*{File|FileLikeObject}*/, filter, options) {
            console.info('onWhenAddingFileFailed', item, filter, options);
        };
        uploaderImages.onAfterAddingFile = function (fileItem) {
            console.info('onAfterAddingFile', fileItem);
        };
        uploaderImages.onAfterAddingAll = function (addedFileItems) {
            console.info('onAfterAddingAll', addedFileItems);
        };
        uploaderImages.onBeforeUploadItem = function (item) {
            console.log('onBeforeUploadItemXXXX');
        };
        uploaderImages.onProgressItem = function (fileItem, progress) {
            console.info('onProgressItem', fileItem, progress);
        };
        uploaderImages.onProgressAll = function (progress) {
            console.info('onProgressAll', progress);
        };
        uploaderImages.onSuccessItem = function (fileItem, response, status, headers) {
            console.info('onSuccessItem', fileItem, response, status, headers);
        };
        uploaderImages.onErrorItem = function (fileItem, response, status, headers) {
            console.info('onErrorItem', fileItem, response, status, headers);
        };
        uploaderImages.onCancelItem = function (fileItem, response, status, headers) {
            console.info('onCancelItem', fileItem, response, status, headers);
        };
        uploaderImages.onCompleteItem = function (fileItem, response, status, headers) {
            console.info('onCompleteItem', fileItem, response, status, headers);
        };
        uploaderImages.onCompleteAll = function () {
            console.info('onCompleteAll');
        };
        console.info('uploaderX', uploaderImages);
        AulaFactory.query().$promise.then(function (result) {
            $scope.aulas = result;
            UsuarioFactory.get({idUsuario: 'oscar7685'}).$promise.then(function (result2) {
                $scope.solicitud = {
                    idsolicitud: "",
                    usuario: result2,
                    fecha: "",
                    solicitud: "",
                    aula: ""
                };
            });
            $scope.master = angular.copy($scope.solicitud);
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
                            $scope.solicitud.fecha = new Date();
                            SolicitudFactory.save($scope.solicitud).$promise.then(function (result) {
                                if (uploaderImages.queue.length > 0) {
                                    uploaderImages.uploadAll();
                                } else {
                                    console.log("hacer lo que se valla a hacer");
                                    //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                                    $location.path("app/mantenimiento/horarios");
                                }

                            }, function (bussinessMessages) {
                                $scope.bussinessMessages = bussinessMessages;
                            });
                        }
                    }

                },
                reset: function (form) {
                    $scope.solicitud = angular.copy($scope.master);
                    form.$setPristine(true);
                }
            };
        });
    }]);
app.controller('editarSolicitudMantenimientoCtrl2', ["$scope", "$http", "$state", "$stateParams", "SolicitudFactory", "AulaFactory", "UsuarioFactory", "$location", "SweetAlert", "FileUploader",
    function ($scope, $http, $state, $stateParams, SolicitudFactory, AulaFactory, UsuarioFactory, $location, SweetAlert, FileUploader) {

        var uploaderImages = $scope.uploaderImages = new FileUploader({
            url: '/sac/SubirArchivo'
        });
        // FILTERS

        SolicitudFactory.get({idSolicitud: $stateParams.idsolicitud}).$promise.then(function (result) {
            $scope.solicitud = result;
            $http({
                method: 'GET',
                url: '/sac/SubirArchivo?idSolicitud=' + $scope.solicitud.idsolicitud
            }).success(function (datos, status, headers, config) {
                var UploadedFiles = datos;



                for (var i = 0; i < UploadedFiles.length; i++) {
                    var fileItems = [];
                    fileItems[i] = new FileUploader.FileItem(uploaderImages, UploadedFiles[i]);
                    fileItems[i].progress = 100;
                    fileItems[i].isUploaded = true;
                    fileItems[i].isSuccess = true;
                    uploaderImages.queue.push(fileItems[i]);
                }


                uploaderImages.filters.push({
                    name: 'imageFilter',
                    fn: function (item/*{File|FileLikeObject}*/, options) {
                        return this.queue.length < 5;
                    }
                });
                // CALLBACKS

                uploaderImages.onWhenAddingFileFailed = function (item/*{File|FileLikeObject}*/, filter, options) {
                    console.info('onWhenAddingFileFailed', item, filter, options);
                };
                uploaderImages.onAfterAddingFile = function (fileItem) {
                    console.info('onAfterAddingFile', fileItem);
                };
                uploaderImages.onAfterAddingAll = function (addedFileItems) {
                    console.info('onAfterAddingAll', addedFileItems);
                };
                uploaderImages.onBeforeUploadItem = function (item) {
                    console.log('onBeforeUploadItemXXXX');
                };
                uploaderImages.onProgressItem = function (fileItem, progress) {
                    console.info('onProgressItem', fileItem, progress);
                };
                uploaderImages.onProgressAll = function (progress) {
                    console.info('onProgressAll', progress);
                };
                uploaderImages.onSuccessItem = function (fileItem, response, status, headers) {
                    console.info('onSuccessItem', fileItem, response, status, headers);
                };
                uploaderImages.onErrorItem = function (fileItem, response, status, headers) {
                    console.info('onErrorItem', fileItem, response, status, headers);
                };
                uploaderImages.onCancelItem = function (fileItem, response, status, headers) {
                    console.info('onCancelItem', fileItem, response, status, headers);
                };
                uploaderImages.onCompleteItem = function (fileItem, response, status, headers) {
                    console.info('onCompleteItem', fileItem, response, status, headers);
                };
                uploaderImages.onCompleteAll = function () {
                    console.info('onCompleteAll');
                };
                console.info('uploaderXX', uploaderImages);
                AulaFactory.query().$promise.then(function (result) {
                    $scope.aulas = result;
                    $scope.master = angular.copy($scope.solicitud);
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
                                    SolicitudFactory.save($scope.solicitud).$promise.then(function (result) {
                                        if (uploaderImages.queue.length > 0) {
                                            uploaderImages.uploadAll();
                                        } else {
                                            console.log("hacer lo que se valla a hacer");
                                            //SweetAlert.swal("Good job!", "Your form is ready to be submitted!", "success");
                                            $location.path("app/mantenimiento/horarios");
                                        }

                                    }, function (bussinessMessages) {
                                        $scope.bussinessMessages = bussinessMessages;
                                    });
                                }
                            }

                        },
                        reset: function (form) {
                            $scope.solicitud = angular.copy($scope.master);
                            form.$setPristine(true);
                        }
                    };
                });


            });

        });



    }]);
