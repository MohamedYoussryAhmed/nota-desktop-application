#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFont>
#include <QIcon>

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);

	app.setOrganizationDomain("ElMoaskar@gmail.com");
	app.setOrganizationName("ElMoaskar");
	app.setWindowIcon(QIcon(":/icons/app-icon.png"));

	QFont defaultFont("Ubuntu", 10);
	app.setFont(defaultFont);

	QQmlApplicationEngine engine;
	QObject::connect(
		&engine,
		&QQmlApplicationEngine::objectCreationFailed,
		&app,
		[]() { QCoreApplication::exit(-1); },
		Qt::QueuedConnection);

	engine.loadFromModule("Nota", "Main");
	return app.exec();
}
