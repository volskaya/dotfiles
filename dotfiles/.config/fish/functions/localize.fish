function localize
    switch "$argv"
        case -h --help
            echo "Localizes with `flutter gen-l10n` and moves the generated dart files"
            echo "to the `lib` folder."
            echo ""
            echo "Options:"
            echo "       -p or --package  Move to `lib/src` instead."
        case \*
            if [ pubspec.yaml ]
                # Generate locales.
                flutter gen-l10n

                # Copy them to the lib folder.
                switch "$argv"
                    case -p --package
                        mkdir --parents ./lib/src/l10n/
                        mv ./.dart_tool/flutter_gen/gen_l10n/* ./lib/src/l10n/
                    case \*
                        mkdir --parents ./lib/l10n/
                        mv ./.dart_tool/flutter_gen/gen_l10n/* ./lib/l10n/
                end
            else
                echo "Could not find pubspec.yaml in this directory"
            end
    end
end
