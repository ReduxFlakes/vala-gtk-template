project(
    'myapp',
    'vala', 'c',
    version: '0.1.0',
    meson_version: '>= 1.1.0',
    license: 'GPL-3.0-or-later',
)

# Dependencies
gtk4 = dependency('gtk4', version: '>= 4.8')
adw = dependency('libadwaita-1', version: '>= 1.4')

gnome = import('gnome')

add_project_arguments(
  '-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()),
  language: 'c',
)

# Blueprint - required the compiler to be available on the path
blueprint_compiler = find_program('blueprint-compiler')

blueprints = custom_target('blueprints',
  input:   files('data/ui/window.blp'),
  output:  ['window.ui'],
  command: [blueprint_compiler, 'batch-compile',
            '@OUTDIR@', '@CURRENT_SOURCE_DIR@/data/ui', '@INPUT@'],
)

# GResource
resources = gnome.compile_resources('myapp-resources',
  'myapp.gresource.xml',
  dependencies: blueprints,
  source_dir: [meson.current_build_dir(), meson.current_source_dir()],
)

# Build
sources = files(
  'src/main.vala',
  'src/window.vala',
) + resources

executable('myapp', sources,
  dependencies: [gtk4, adw],
  install: true,
)

install_data('data/com.example.myapp.desktop',
  install_dir: get_option('datadir') / 'applications')

# install_data('data/icons/com.example.myapp.svg',
#   install_dir: get_option('datadir') / 'hicolor' / 'scalable' / 'apps')

gnome.post_install()