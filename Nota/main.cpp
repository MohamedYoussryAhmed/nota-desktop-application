#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <include/Driver.h>

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);

	app.setOrganizationDomain("ElMoaskar@gmail.com");
	app.setOrganizationName("ElMoaskar");

	QQmlApplicationEngine engine;
	QObject::connect(
		&engine,
		&QQmlApplicationEngine::objectCreationFailed,
		&app,
		[]() { QCoreApplication::exit(-1); },
		Qt::QueuedConnection);

	// connect the Driver QObject to QML
	Driver* driver = new Driver();
	QQmlContext* rootContext = engine.rootContext();
	rootContext->setContextProperty("Driver", driver);

	engine.loadFromModule("Nota", "Main");
	return app.exec();
}
