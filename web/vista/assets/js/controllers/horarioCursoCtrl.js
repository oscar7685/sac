/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

app.controller('horarioCursoCtrl', ["$scope", "DiasFactory", "HoraFactory", "HorarioFactory", "CursoFactory", "$location", "SweetAlert", "$filter",
    function ($scope, DiasFactory, HoraFactory, HorarioFactory, CursoFactory, $location, SweetAlert, $filter) {
        CursoFactory.query().$promise.then(function (result0) {
            $scope.cursos = result0;

            DiasFactory.query().$promise.then(function (result) {
                $scope.dias = result;

                HoraFactory.query().$promise.then(function (result2) {
                    $scope.horas = result2;

                    HorarioFactory.buscarC({idcurso: '1'}).$promise.then(function (result3) {
                        $scope.horarios = result3;
                    });

                });
            });

        });

        $scope.$watch('curso.idcurso', function (newVal) {
            if (newVal) {
                CursoFactory.get({idCurso: newVal}).$promise.then(function (result) {
                    HorarioFactory.buscarC({idcurso: result.idcurso}).$promise.then(function (result3) {
                        $scope.horarios = result3;
                    });

                });
            }
        });

    }]);


