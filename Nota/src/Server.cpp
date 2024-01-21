#include <include/Server.h>

#include <QDebug>

Server::Server(const QString& databaseName, QObject* parent)
	: QObject(parent)
{
	connectDataBase(databaseName);
}

// DataBase Table Management Requests
bool Server::request_add_table(const QString& table_name)
{
	qInfo() << QString("Adding table %1 ...").arg(table_name);

	// 1 for success
	return 1;
}

// private
void Server::connectDataBase(const QString& databaseName)
{
	mDataBase = QSqlDatabase::addDatabase("QSQLITE");
	mDataBase.setDatabaseName(databaseName);

	// open database
	if (mDataBase.open())
		qInfo() << "DataBase Connected Succefullly ...";
	else
		qInfo() << "DataBase Connection Failed ... " << mDataBase.lastError().text();
}

