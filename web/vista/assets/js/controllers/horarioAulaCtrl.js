/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

app.controller('horarioAulaCtrl', ["$scope", "DiasFactory", "HoraFactory", "HorarioFactory", "AulaFactory", "$location", "SweetAlert", "$filter",
    function ($scope, DiasFactory, HoraFactory, HorarioFactory, AulaFactory, $location, SweetAlert, $filter) {
        AulaFactory.query().$promise.then(function (result0) {
            $scope.aulas = result0;

            DiasFactory.query().$promise.then(function (result) {
                $scope.dias = result;

                HoraFactory.query().$promise.then(function (result2) {
                    $scope.horas = result2;

                    HorarioFactory.buscarA({idaula: '1'}).$promise.then(function (result3) {
                        $scope.horarios = result3;
                    });

                });
            });

        });

        $scope.$watch('aula.idaula', function (newVal) {
            if (newVal) {
                AulaFactory.get({idAula: newVal}).$promise.then(function (result) {
                    HorarioFactory.buscarA({idaula: result.idaula}).$promise.then(function (result3) {
                        $scope.horarios = result3;
                    });

                });
            }
        });

    }]);


