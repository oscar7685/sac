'use strict';
/**
 * Config for the router
 */

app.config(['$stateProvider', '$urlRouterProvider', '$controllerProvider', '$compileProvider', '$filterProvider', '$provide', '$ocLazyLoadProvider', 'JS_REQUIRES',
    function ($stateProvider, $urlRouterProvider, $controllerProvider, $compileProvider, $filterProvider, $provide, $ocLazyLoadProvider, jsRequires) {

        app.controller = $controllerProvider.register;
        app.directive = $compileProvider.directive;
        app.filter = $filterProvider.register;
        app.factory = $provide.factory;
        app.service = $provide.service;
        app.constant = $provide.constant;
        app.value = $provide.value;
        // LAZY MODULES

        $ocLazyLoadProvider.config({
            debug: false,
            events: true,
            modules: jsRequires.modules
        });
        // APPLICATION ROUTES
        // -----------------------------------
        // For any unmatched url, redirect to /app/dashboard
        $urlRouterProvider.otherwise("/login/signin");
        //
        // Set up the states
        $stateProvider.state('app', {
            url: "/app",
            templateUrl: "assets/views/app.html",
            resolve: loadSequence('modernizr', 'moment', 'angularMoment', 'uiSwitch', 'perfect-scrollbar-plugin', 'toaster', 'ngAside', 'vAccordion', 'sweet-alert', 'chartjs', 'tc.chartjs', 'oitozero.ngSweetAlert', 'chatCtrl'),
            abstract: true
        }).state('app.dashboard', {
            url: "/dashboard",
            templateUrl: "assets/views/dashboard0.html",
            resolve: loadSequence('jquery-sparkline', 'dashboardCtrl'),
            title: 'Dashboard',
            ncyBreadcrumb: {
                label: 'Dashboard'
            }
        }).state('app.ui', {
            url: '/ui',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'UI Elements',
            ncyBreadcrumb: {
                label: 'UI Elements'
            }
        }).state('app.ui.elements', {
            url: '/elements',
            templateUrl: "assets/views/ui_elements.html",
            title: 'Elements',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Elements'
            }
        }).state('app.aulas', {
            url: '/aulas',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Aulas',
            ncyBreadcrumb: {
                label: 'Aulas'
            }
        }).state('app.aulas.crear', {
            url: '/crear',
            templateUrl: "assets/views/aulas/crear.html",
            title: 'Crear Aulas',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Crear Aulas'
            },
            resolve: loadSequence('aulas')
        }).state('app.aulas.listar', {
            url: '/listar',
            templateUrl: "assets/views/aulas/listar.html",
            title: 'Listar Aulas',
            ncyBreadcrumb: {
                label: 'Listar Aulas'
            },
            resolve: loadSequence('ngTable', 'aulas')
        }).state('app.aulas.editar', {
            url: '/editar:idaula',
            templateUrl: "assets/views/aulas/editar.html",
            title: 'Editar Aulas',
            ncyBreadcrumb: {
                label: 'Editar Aulas'
            },
            resolve: loadSequence('aulas')
        }).state('app.facultades', {
            url: '/facultades',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Facultades',
            ncyBreadcrumb: {
                label: 'Facultades'
            }
        }).state('app.facultades.crear', {
            url: '/crear',
            templateUrl: "assets/views/facultad/crear.html",
            title: 'Crear Facultades',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Crear Facultad'
            },
            resolve: loadSequence('facultadCtrl')
        }).state('app.facultades.listar', {
            url: '/listar',
            templateUrl: "assets/views/facultad/listar.html",
            title: 'Listar Facultades',
            ncyBreadcrumb: {
                label: 'Listar Facultades'
            },
            resolve: loadSequence('ngTable', 'facultadCtrl')
        }).state('app.facultades.editar', {
            url: '/editar:idfacultad',
            templateUrl: "assets/views/facultad/editar.html",
            title: 'Editar Facultad',
            ncyBreadcrumb: {
                label: 'Editar Facultades'
            },
            resolve: loadSequence('facultadCtrl')
        }).state('app.programas', {
            url: '/programas',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Programas',
            ncyBreadcrumb: {
                label: 'Programas'
            }
        }).state('app.programas.crear', {
            url: '/crear',
            templateUrl: "assets/views/programas/crear.html",
            title: 'Crear Programa',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Crear Programa'
            },
            resolve: loadSequence('programaCtrl')
        }).state('app.programas.listar', {
            url: '/listar',
            templateUrl: "assets/views/programas/listar.html",
            title: 'Listar Programa',
            ncyBreadcrumb: {
                label: 'Listar Programa'
            },
            resolve: loadSequence('ngTable', 'programaCtrl')
        }).state('app.programas.editar', {
            url: '/editar:idprograma',
            templateUrl: "assets/views/programas/editar.html",
            title: 'Editar Programa',
            ncyBreadcrumb: {
                label: 'Editar Programa'
            },
            resolve: loadSequence('ngTable', 'programaCtrl')
        }).state('app.estudiantes', {
            url: '/estudiantes',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Estudiantes',
            ncyBreadcrumb: {
                label: 'Estudiantes'
            }
        }).state('app.estudiantes.crear', {
            url: '/crear',
            templateUrl: "assets/views/estudiantes/crear.html",
            title: 'Crear Estudiante',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Crear Estudiantes'
            },
            resolve: loadSequence('ui.select', 'monospaced.elastic', 'ui.mask', 'touchspin-plugin', 'estudianteCtrl')
        }).state('app.estudiantes.listar', {
            url: '/listar',
            templateUrl: "assets/views/estudiantes/listar.html",
            title: 'Listar Estudiantes',
            ncyBreadcrumb: {
                label: 'Listar Estudiantes'
            },
            resolve: loadSequence('ngTable', 'estudianteCtrl')
        }).state('app.estudiantes.editar', {
            url: '/editar:codigo',
            templateUrl: "assets/views/estudiantes/editar.html",
            title: 'Editar Estudiante',
            ncyBreadcrumb: {
                label: 'Editar Estudiante'
            },
            resolve: loadSequence('ui.select', 'monospaced.elastic', 'ui.mask', 'touchspin-plugin', 'estudianteCtrl')
        }).state('app.asignaturas', {
            url: '/asignaturas',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Asignaturas',
            ncyBreadcrumb: {
                label: 'Asignaturas'
            }
        }).state('app.asignaturas.crear', {
            url: '/crear',
            templateUrl: "assets/views/asignaturas/crear.html",
            title: 'Crear Asignatura',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Crear Asignatura'
            },
            resolve: loadSequence('asignaturaCtrl')
        }).state('app.asignaturas.listar', {
            url: '/listar',
            templateUrl: "assets/views/asignaturas/listar.html",
            title: 'Listar Asignaturas',
            ncyBreadcrumb: {
                label: 'Listar Asignaturas'
            },
            resolve: loadSequence('ngTable', 'asignaturaCtrl')
        }).state('app.asignaturas.editar', {
            url: '/editar:idasignatura',
            templateUrl: "assets/views/asignaturas/editar.html",
            title: 'Editar Asignatura',
            ncyBreadcrumb: {
                label: 'Editar asignatura'
            },
            resolve: loadSequence('programaCtrl')
        }).state('app.usuarios', {
            url: '/usuarios',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Usuarios',
            ncyBreadcrumb: {
                label: 'Usuarios'
            }
        }).state('app.usuarios.crear', {
            url: '/crear',
            templateUrl: "assets/views/usuarios/crear.html",
            title: 'Crear Usuarios',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Crear Usuarios'
            },
            resolve: loadSequence('usuarioCtrl')
        }).state('app.usuarios.listar', {
            url: '/listar',
            templateUrl: "assets/views/usuarios/listar.html",
            title: 'Listar Usuarios',
            ncyBreadcrumb: {
                label: 'Listar Usuarios'
            },
            resolve: loadSequence('ngTable', 'usuarioCtrl')
        }).state('app.usuarios.editar', {
            url: '/editar:idusuario',
            templateUrl: "assets/views/usuarios/editar.html",
            title: 'Editar Usuarios',
            ncyBreadcrumb: {
                label: 'Editar Usuarios'
            },
            resolve: loadSequence('usuarioCtrl')
        }).state('app.roles', {
            url: '/roles',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Roles',
            ncyBreadcrumb: {
                label: 'Roles'
            }
        }).state('app.roles.crear', {
            url: '/crear',
            templateUrl: "assets/views/roles/crear.html",
            title: 'Crear Roles',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Crear Roles'
            },
            resolve: loadSequence('rolCtrl')
        }).state('app.roles.listar', {
            url: '/listar',
            templateUrl: "assets/views/roles/listar.html",
            title: 'Listar Roles',
            ncyBreadcrumb: {
                label: 'Listar Roles'
            },
            resolve: loadSequence('ngTable', 'rolCtrl')
        }).state('app.roles.editar', {
            url: '/editar:idrol',
            templateUrl: "assets/views/roles/editar.html",
            title: 'Editar Roles',
            ncyBreadcrumb: {
                label: 'Editar Roles'
            },
            resolve: loadSequence('rolCtrl')
        }).state('app.edificios', {
            url: '/edificios',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Edificios',
            ncyBreadcrumb: {
                label: 'Edificios'
            }
        }).state('app.edificios.crear', {
            url: '/crear',
            templateUrl: "assets/views/edificios/crear.html",
            title: 'Crear Edificios',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Crear Edificios'
            },
            resolve: loadSequence('validationCtrl')
        }).state('app.edificios.listar', {
            url: '/listar',
            templateUrl: "assets/views/edificios/listar.html",
            title: 'Listar Edificios',
            ncyBreadcrumb: {
                label: 'Listar Edificios'
            },
            resolve: loadSequence('ngTable', 'ngTableCtrl')
        }).state('app.edificios.editar', {
            url: '/editar:idedificio',
            templateUrl: "assets/views/edificios/editar.html",
            title: 'Editar Edificios',
            ncyBreadcrumb: {
                label: 'Editar Edificios'
            },
            resolve: loadSequence('validationCtrl')
        }).state('app.profesores', {
            url: '/profesores',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Profesores',
            ncyBreadcrumb: {
                label: 'Profesores'
            }
        }).state('app.profesores.crear', {
            url: '/crear',
            templateUrl: "assets/views/profesores/crear.html",
            title: 'Crear Profesores',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Crear Profesores'
            },
            resolve: loadSequence('ui.select', 'monospaced.elastic', 'ui.mask', 'touchspin-plugin', 'profesorCtrl')
        }).state('app.profesores.listar', {
            url: '/listar',
            templateUrl: "assets/views/profesores/listar.html",
            title: 'Listar Profesores',
            ncyBreadcrumb: {
                label: 'Listar Profesores'
            },
            resolve: loadSequence('ngTable', 'profesorCtrl')
        }).state('app.profesores.editar', {
            url: '/editar:idprofesor',
            templateUrl: "assets/views/profesores/editar.html",
            title: 'Editar Profesor',
            ncyBreadcrumb: {
                label: 'Editar Profesor'
            },
            resolve: loadSequence('profesorCtrl')
        }).state('app.graduados', {
            url: '/graduados',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Graduados',
            ncyBreadcrumb: {
                label: 'Graduados'
            }
        }).state('app.graduados.crear', {
            url: '/crear',
            templateUrl: "assets/views/graduados/crear.html",
            title: 'Crear Graduados',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Crear graduados'
            },
            resolve: loadSequence('ui.select', 'monospaced.elastic', 'ui.mask', 'touchspin-plugin', 'graduadoCtrl')
        }).state('app.graduados.listar', {
            url: '/listar',
            templateUrl: "assets/views/graduados/listar.html",
            title: 'Listar Graduados',
            ncyBreadcrumb: {
                label: 'Listar Graduados'
            },
            resolve: loadSequence('ngTable', 'graduadoCtrl')
        }).state('app.graduados.editar', {
            url: '/editar:idgraduado',
            templateUrl: "assets/views/graduados/editar.html",
            title: 'Editar Graduado',
            ncyBreadcrumb: {
                label: 'Editar Graduado'
            },
            resolve: loadSequence('ui.select', 'monospaced.elastic', 'ui.mask', 'touchspin-plugin', 'graduadoCtrl')
        }).state('app.cursos', {
            url: '/cursos',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Cursos',
            ncyBreadcrumb: {
                label: 'Cursos'
            }
        }).state('app.cursos.crear', {
            url: '/crear',
            templateUrl: "assets/views/cursos/crear.html",
            title: 'Crear Cursos',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Crear Cursos'
            },
            resolve: loadSequence('cursoCtrl')
        }).state('app.cursos.multipleCrear', {
            url: '/multipleCrear',
            templateUrl: "assets/views/cursos/crearCursosPeriodo.html",
            title: 'Crear Cursos',
            icon: 'ti-layout-media-left-alt',
            ncyBreadcrumb: {
                label: 'Crear Cursos'
            },
            resolve: loadSequence('cursoCtrl')
        }).state('app.cursos.listar', {
            url: '/listar',
            templateUrl: "assets/views/cursos/listar.html",
            title: 'Listar Cursos',
            ncyBreadcrumb: {
                label: 'Listar Cursos'
            },
            resolve: loadSequence('ngTable', 'cursoCtrl')
        }).state('app.cursos.editar', {
            url: '/editar:idcurso',
            templateUrl: "assets/views/cursos/editar.html",
            title: 'Editar Curso',
            ncyBreadcrumb: {
                label: 'Editar Curso'
            },
            resolve: loadSequence('cursoCtrl')
        }).state('app.cursos.estudiantes', {
            url: '/estudiantes',
            templateUrl: "assets/views/cursos/estudiantes.html",
            title: 'Estudiantes del Curso',
            ncyBreadcrumb: {
                label: 'Estudiantes del Curso'
            },
            resolve: loadSequence('cursoCtrl')
        }).state('app.ui.buttons', {
            url: '/buttons',
            templateUrl: "assets/views/ui_buttons.html",
            title: 'Buttons',
            resolve: loadSequence('spin', 'ladda', 'angular-ladda', 'laddaCtrl'),
            ncyBreadcrumb: {
                label: 'Buttons'
            }
        }).state('app.ui.links', {
            url: '/links',
            templateUrl: "assets/views/ui_links.html",
            title: 'Link Effects',
            ncyBreadcrumb: {
                label: 'Link Effects'
            }
        }).state('app.ui.icons', {
            url: '/icons',
            templateUrl: "assets/views/ui_icons.html",
            title: 'Font Awesome Icons',
            ncyBreadcrumb: {
                label: 'Font Awesome Icons'
            },
            resolve: loadSequence('iconsCtrl')
        }).state('app.ui.lineicons', {
            url: '/line-icons',
            templateUrl: "assets/views/ui_line_icons.html",
            title: 'Linear Icons',
            ncyBreadcrumb: {
                label: 'Linear Icons'
            },
            resolve: loadSequence('iconsCtrl')
        }).state('app.ui.modals', {
            url: '/modals',
            templateUrl: "assets/views/ui_modals.html",
            title: 'Modals',
            ncyBreadcrumb: {
                label: 'Modals'
            },
            resolve: loadSequence('asideCtrl')
        }).state('app.ui.toggle', {
            url: '/toggle',
            templateUrl: "assets/views/ui_toggle.html",
            title: 'Toggle',
            ncyBreadcrumb: {
                label: 'Toggle'
            }
        }).state('app.ui.tabs_accordions', {
            url: '/accordions',
            templateUrl: "assets/views/ui_tabs_accordions.html",
            title: "Tabs & Accordions",
            ncyBreadcrumb: {
                label: 'Tabs & Accordions'
            },
            resolve: loadSequence('vAccordionCtrl')
        }).state('app.ui.panels', {
            url: '/panels',
            templateUrl: "assets/views/ui_panels.html",
            title: 'Panels',
            ncyBreadcrumb: {
                label: 'Panels'
            }
        }).state('app.ui.notifications', {
            url: '/notifications',
            templateUrl: "assets/views/ui_notifications.html",
            title: 'Notifications',
            ncyBreadcrumb: {
                label: 'Notifications'
            },
            resolve: loadSequence('toasterCtrl', 'sweetAlertCtrl')
        }).state('app.ui.treeview', {
            url: '/treeview',
            templateUrl: "assets/views/ui_tree.html",
            title: 'TreeView',
            ncyBreadcrumb: {
                label: 'Treeview'
            },
            resolve: loadSequence('angularBootstrapNavTree', 'treeCtrl')
        }).state('app.ui.media', {
            url: '/media',
            templateUrl: "assets/views/ui_media.html",
            title: 'Media',
            ncyBreadcrumb: {
                label: 'Media'
            }
        }).state('app.ui.nestable', {
            url: '/nestable2',
            templateUrl: "assets/views/ui_nestable.html",
            title: 'Nestable List',
            ncyBreadcrumb: {
                label: 'Nestable List'
            },
            resolve: loadSequence('jquery-nestable-plugin', 'ng-nestable', 'nestableCtrl')
        }).state('app.ui.typography', {
            url: '/typography',
            templateUrl: "assets/views/ui_typography.html",
            title: 'Typography',
            ncyBreadcrumb: {
                label: 'Typography'
            }
        }).state('app.table', {
            url: '/table',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Tables',
            ncyBreadcrumb: {
                label: 'Tables'
            }
        }).state('app.table.basic', {
            url: '/basic',
            templateUrl: "assets/views/table_basic.html",
            title: 'Basic Tables',
            ncyBreadcrumb: {
                label: 'Basic'
            }
        }).state('app.table.responsive', {
            url: '/responsive',
            templateUrl: "assets/views/table_responsive.html",
            title: 'Responsive Tables',
            ncyBreadcrumb: {
                label: 'Responsive'
            }
        }).state('app.table.dynamic', {
            url: '/dynamic',
            templateUrl: "assets/views/table_dynamic.html",
            title: 'Dynamic Tables',
            ncyBreadcrumb: {
                label: 'Dynamic'
            },
            resolve: loadSequence('dynamicTableCtrl')
        }).state('app.table.data', {
            url: '/data',
            templateUrl: "assets/views/table_data.html",
            title: 'ngTable',
            ncyBreadcrumb: {
                label: 'ngTable'
            },
            resolve: loadSequence('ngTable', 'ngTableCtrl')
        }).state('app.table.export', {
            url: '/export',
            templateUrl: "assets/views/table_export.html",
            title: 'Table'
        }).state('app.form', {
            url: '/form',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Forms',
            ncyBreadcrumb: {
                label: 'Forms'
            }
        }).state('app.form.elements', {
            url: '/elements',
            templateUrl: "assets/views/form_elements.html",
            title: 'Forms Elements',
            ncyBreadcrumb: {
                label: 'Elements'
            },
            resolve: loadSequence('ui.select', 'monospaced.elastic', 'ui.mask', 'touchspin-plugin', 'selectCtrl')
        }).state('app.form.xeditable', {
            url: '/xeditable',
            templateUrl: "assets/views/form_xeditable.html",
            title: 'Angular X-Editable',
            ncyBreadcrumb: {
                label: 'X-Editable'
            },
            resolve: loadSequence('xeditable', 'checklist-model', 'xeditableCtrl')
        }).state('app.form.texteditor', {
            url: '/editor',
            templateUrl: "assets/views/form_text_editor.html",
            title: 'Text Editor',
            ncyBreadcrumb: {
                label: 'Text Editor'
            },
            resolve: loadSequence('ckeditor-plugin', 'ckeditor', 'ckeditorCtrl')
        }).state('app.form.wizard', {
            url: '/wizard',
            templateUrl: "assets/views/form_wizard.html",
            title: 'Form Wizard',
            ncyBreadcrumb: {
                label: 'Wizard'
            },
            resolve: loadSequence('wizardCtrl')
        }).state('app.form.validation', {
            url: '/validation',
            templateUrl: "assets/views/form_validation.html",
            title: 'Form Validation',
            ncyBreadcrumb: {
                label: 'Validation'
            },
            resolve: loadSequence('validationCtrl')
        }).state('app.form.cropping', {
            url: '/image-cropping',
            templateUrl: "assets/views/form_image_cropping.html",
            title: 'Image Cropping',
            ncyBreadcrumb: {
                label: 'Image Cropping'
            },
            resolve: loadSequence('ngImgCrop', 'cropCtrl')
        }).state('app.form.upload', {
            url: '/file-upload',
            templateUrl: "assets/views/form_file_upload.html",
            title: 'Multiple File Upload',
            ncyBreadcrumb: {
                label: 'File Upload'
            },
            resolve: loadSequence('angularFileUpload', 'uploadCtrl')
        }).state('app.pages', {
            url: '/pages',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Pages',
            ncyBreadcrumb: {
                label: 'Pages'
            }
        }).state('app.pages.user', {
            url: '/user',
            templateUrl: "assets/views/pages_user_profile.html",
            title: 'User Profile',
            ncyBreadcrumb: {
                label: 'User Profile'
            },
            resolve: loadSequence('flow', 'userCtrl')
        }).state('app.pages.invoice', {
            url: '/invoice',
            templateUrl: "assets/views/pages_invoice.html",
            title: 'Invoice',
            ncyBreadcrumb: {
                label: 'Invoice'
            }
        }).state('app.pages.timeline', {
            url: '/timeline',
            templateUrl: "assets/views/pages_timeline.html",
            title: 'Timeline',
            ncyBreadcrumb: {
                label: 'Timeline'
            },
            resolve: loadSequence('ngMap')
        }).state('app.pages.calendar', {
            url: '/calendar',
            templateUrl: "assets/views/pages_calendar.html",
            title: 'Calendar',
            ncyBreadcrumb: {
                label: 'Calendar'
            },
            resolve: loadSequence('mwl.calendar', 'calendarCtrl')
        }).state('app.pages.messages', {
            url: '/messages',
            templateUrl: "assets/views/pages_messages.html",
            resolve: loadSequence('truncate', 'htmlToPlaintext', 'inboxCtrl')
        }).state('app.pages.messages.inbox', {
            url: '/inbox/:inboxID',
            templateUrl: "assets/views/pages_inbox.html",
            controller: 'ViewMessageCrtl'
        }).state('app.pages.blank', {
            url: '/blank',
            templateUrl: "assets/views/pages_blank_page.html",
            ncyBreadcrumb: {
                label: 'Starter Page'
            }
        }).state('app.utilities', {
            url: '/utilities',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Utilities',
            ncyBreadcrumb: {
                label: 'Utilities'
            }
        }).state('app.utilities.search', {
            url: '/search',
            templateUrl: "assets/views/utility_search_result.html",
            title: 'Search Results',
            ncyBreadcrumb: {
                label: 'Search Results'
            }
        }).state('app.utilities.pricing', {
            url: '/pricing',
            templateUrl: "assets/views/utility_pricing_table.html",
            title: 'Pricing Table',
            ncyBreadcrumb: {
                label: 'Pricing Table'
            }
        }).state('app.maps', {
            url: "/maps",
            templateUrl: "assets/views/maps.html",
            resolve: loadSequence('ngMap', 'mapsCtrl'),
            title: "Maps",
            ncyBreadcrumb: {
                label: 'Maps'
            }
        }).state('app.charts', {
            url: "/charts",
            templateUrl: "assets/views/charts.html",
            resolve: loadSequence('chartjs', 'tc.chartjs', 'chartsCtrl'),
            title: "Charts",
            ncyBreadcrumb: {
                label: 'Charts'
            }
        }).state('app.documentation', {
            url: "/documentation",
            templateUrl: "assets/views/documentation.html",
            title: "Documentation",
            ncyBreadcrumb: {
                label: 'Documentation'
            }
        }).state('error', {
            url: '/error',
            template: '<div ui-view class="fade-in-up"></div>'
        }).state('error.404', {
            url: '/404',
            templateUrl: "assets/views/utility_404.html",
        }).state('error.500', {
            url: '/500',
            templateUrl: "assets/views/utility_500.html",
        })

                // Login routes

                .state('login', {
                    url: '/login',
                    template: '<div ui-view class="fade-in-right-big smooth"></div>',
                    resolve: loadSequence('modernizr', 'moment', 'angularMoment', 'uiSwitch', 'perfect-scrollbar-plugin', 'toaster', 'ngAside', 'vAccordion', 'sweet-alert', 'chartjs', 'tc.chartjs', 'oitozero.ngSweetAlert', 'chatCtrl'),
                    abstract: true
                }).state('login.signin', {
            url: '/signin',
            templateUrl: "assets/views/login_login.html",
            resolve: loadSequence('loginCtrl')
        }).state('login.forgot', {
            url: '/forgot',
            templateUrl: "assets/views/login_forgot.html"
        }).state('login.registration', {
            url: '/registration',
            templateUrl: "assets/views/login_registration.html"
        }).state('login.lockscreen', {
            url: '/lock',
            templateUrl: "assets/views/login_lock_screen.html"
        }).state('app.horario', {
            url: '/horario',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Horario',
            ncyBreadcrumb: {
                label: 'Horario'
            }
        }).state('app.horario.aula', {
            url: '/aula',
            templateUrl: "assets/views/horario/aula.html",
            title: 'Horario Aula',
            ncyBreadcrumb: {
                label: 'Horario Aula'
            },
            resolve: loadSequence('mwl.calendar', 'horarioAulaCtrl')
        }).state('app.horario.curso', {
            url: '/curso',
            templateUrl: "assets/views/horario/curso.html",
            title: 'Horario Curso',
            ncyBreadcrumb: {
                label: 'Horario Curso'
            },
            resolve: loadSequence('mwl.calendar', 'horarioCursoCtrl')
        }).state('app.mantenimiento', {
            url: '/mantenimiento',
            template: '<div ui-view class="fade-in-up"></div>',
            title: 'Mantenimiento',
            ncyBreadcrumb: {
                label: 'Mantenimiento'
            }
        }).state('app.mantenimiento.horario', {
            url: '/horario',
            templateUrl: "assets/views/mantenimiento/horario.html",
            title: 'Horario de Mantenimientos',
            ncyBreadcrumb: {
                label: 'Horario de Mantenimientos'
            },
            resolve: loadSequence('mwl.calendar', 'calendarCtrl')
        }).state('app.mantenimiento.crear', {
            url: '/horario',
            templateUrl: "assets/views/mantenimiento/crear.html",
            title: 'Crear Mantenimiento',
            ncyBreadcrumb: {
                label: 'Crear Mantenimiento'
            },
            resolve: loadSequence('mantenimientoCtrl')
        }).state('app.mantenimiento.solicitar', {
            url: '/crear',
            templateUrl: "assets/views/mantenimiento/solicitar.html",
            title: 'Solicitar Mantenimientos',
            ncyBreadcrumb: {
                label: 'Solicitar Mantenimientos'
            },
            resolve: loadSequence('angularFileUpload', 'mantenimientoCtrl')
        }).state('app.mantenimiento.solicitudes', {
            url: '/solicitudes',
            templateUrl: "assets/views/mantenimiento/solicitudes.html",
            title: 'Listar Solicitudes',
            ncyBreadcrumb: {
                label: 'Listar Solicitudes'
            },
            resolve: loadSequence('ngTable', 'mantenimientoCtrl')
        }).state('app.mantenimiento.editarSolicitud', {
            url: '/editarSolicitud:idsolicitud',
            templateUrl: "assets/views/mantenimiento/editarsolicitud.html",
            title: 'Editar Solicitud',
            ncyBreadcrumb: {
                label: 'Editar Solicitud'
            },
            resolve: loadSequence('angularFileUpload', 'mantenimientoCtrl')
        }).state('app.horario.profesor', {
            url: '/profesor',
            templateUrl: "assets/views/horario/profesor.html",
            title: 'Horario Profesor',
            ncyBreadcrumb: {
                label: 'Horario Profesor'
            },
            resolve: loadSequence('mwl.calendar', 'horarioProfesorCtrl')
        });
        // Generates a resolve object previously configured in constant.JS_REQUIRES (config.constant.js)
        function loadSequence() {
            var _args = arguments;
            return {
                deps: ['$ocLazyLoad', '$q',
                    function ($ocLL, $q) {
                        var promise = $q.when(1);
                        for (var i = 0, len = _args.length; i < len; i++) {
                            promise = promiseThen(_args[i]);
                        }
                        return promise;
                        function promiseThen(_arg) {
                            if (typeof _arg == 'function')
                                return promise.then(_arg);
                            else
                                return promise.then(function () {
                                    var nowLoad = requiredData(_arg);
                                    if (!nowLoad)
                                        return $.error('Route resolve: Bad resource name [' + _arg + ']');
                                    return $ocLL.load(nowLoad);
                                });
                        }

                        function requiredData(name) {
                            if (jsRequires.modules)
                                for (var m in jsRequires.modules)
                                    if (jsRequires.modules[m].name && jsRequires.modules[m].name === name)
                                        return jsRequires.modules[m];
                            return jsRequires.scripts && jsRequires.scripts[name];
                        }
                    }]
            };
        }
    }]);
app.factory('EdificioFactory', function ($resource) {
    return $resource('/sac/api/Edificio/:idEdificio', null, {
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('EstudianteFactory', function ($resource) {
    return $resource('/sac/api/Estudiante/:codigo', null, {
        buscarC: {
            method: 'GET',
            url: '/sac/api/Estudiante/curso/:idcurso/',
            isArray: true
        },
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('AulaFactory', function ($resource) {
    return $resource('/sac/api/Aula/:idAula', null, {
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('FacultadFactory', function ($resource) {
    return $resource('/sac/api/Facultad/:idFacultad', null, {
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('ProfesorFactory', function ($resource) {
    return $resource('/sac/api/Profesor/:idProfesor', null, {
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('GraduadoFactory', function ($resource) {
    return $resource('/sac/api/Graduado/:idGraduado', null, {
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('ProgramaFactory', function ($resource) {
    return $resource('/sac/api/Programa/:idPrograma', null, {
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('AsignaturaFactory', function ($resource) {
    return $resource('/sac/api/Asignatura/:idAsignatura', null, {
        buscarA: {
            method: 'GET',
            url: '/sac/api/Asignatura/programa/:idprograma/',
            isArray: true
        },
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('CursoFactory', function ($resource) {
    return $resource('/sac/api/Curso/:idCurso', null, {
        buscarB: {
            method: 'GET',
            url: '/sac/api/Curso/cursobase/',
            isArray: true
        },
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('DiasFactory', function ($resource) {
    return $resource('/sac/api/Dias/:idDia', null, {
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('HoraFactory', function ($resource) {
    return $resource('/sac/api/Hora/:idHora', null, {
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('SolicitudFactory', function ($resource) {
    return $resource('/sac/api/Solicitud/:idSolicitud', null, {
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('MantenimientoFactory', function ($resource) {
    return $resource('/sac/api/Mantenimiento/:idMantenimiento', null, {
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('UsuarioFactory', function ($resource) {
    return $resource('/sac/api/Usuario/:idUsuario', null, {
        login: {
            method: 'POST',
            url: '/sac/api/Usuario/Login',
            headers: {'Content-Type': 'application/json'},
            params: {usuario: '@usuario', password: '@password'},
            isArray: false
        }
    });
});
app.factory('RolFactory', function ($resource) {
    return $resource('/sac/api/Rol/:idRol', null, {
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('PermisoFactory', function ($resource) {
    return $resource('/sac/api/Permiso/:idPermiso', null, {
        update: {
            method: 'PUT' // this method issues a PUT request
        }
    });
});
app.factory('HorarioFactory', function ($resource) {
    return $resource('/sac/api/Horario/:idHorario', null,
            {
                buscarC: {
                    method: 'GET',
                    url: '/sac/api/Horario/curso/:idcurso/',
                    isArray: true
                },
                buscarA: {
                    method: 'GET',
                    url: '/sac/api/Horario/aula/:idaula/',
                    isArray: true
                },
                buscarP: {
                    method: 'GET',
                    url: '/sac/api/Horario/profesor/:idprofesor/',
                    isArray: true
                },
                update: {
                    method: 'PUT' // this method issues a PUT request
                }
            }
    );
});
