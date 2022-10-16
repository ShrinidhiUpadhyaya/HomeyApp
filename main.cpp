#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterSingletonType(QUrl("qrc:/qml/components/AppThemes.qml"),"AppThemes",1,0,"AppThemes");
    qmlRegisterSingletonType(QUrl("qrc:/qml/screenManager/DModels.qml"),"DModels",1,0,"DModels");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
