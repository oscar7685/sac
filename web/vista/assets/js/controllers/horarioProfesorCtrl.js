/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

app.controller('horarioProfesorCtrl', ["$scope", "DiasFactory", "HoraFactory", "HorarioFactory", "ProfesorFactory", "$location", "SweetAlert", "$filter",
    function ($scope, DiasFactory, HoraFactory, HorarioFactory, ProfesorFactory, $location, SweetAlert, $filter) {
        ProfesorFactory.query().$promise.then(function (result0) {
            $scope.profesores = result0;

            DiasFactory.query().$promise.then(function (result) {
                $scope.dias = result;

                HoraFactory.query().$promise.then(function (result2) {
                    $scope.horas = result2;

                    HorarioFactory.buscarP({idprofesor: '1'}).$promise.then(function (result3) {
                        $scope.horarios = result3;
                    });

                });
            });

        });

        $scope.$watch('profesor.idprofesor', function (newVal) {
            if (newVal) {
                ProfesorFactory.get({idProfesor: newVal}).$promise.then(function (result) {
                    HorarioFactory.buscarP({idprofesor: result.idprofesor}).$promise.then(function (result3) {
                        $scope.horarios = result3;
                    });

                });
            }
        });

    }]);


