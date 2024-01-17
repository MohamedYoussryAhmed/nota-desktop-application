#include "include/Driver.h"

#include <QDebug>

Driver::Driver(QObject *parent) :
	QObject(parent)
{
	connectDataBase();
}

void Driver::connectDataBase()
{
	mDataBase = QSqlDatabase::addDatabase("QSQLITE");
	mDataBase.setDatabaseName("NotaDataBase.db");

	// open database
	if (mDataBase.open())
		qInfo() << "DataBase Connected Succefullly ...";
	else
		qInfo() << "DataBase Connection Failed ... " << mDataBase.lastError().text();
}
