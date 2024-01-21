#include "include/Client.h"

#include <QDebug>

Client::Client(QObject *parent) :
	QObject(parent)
{
	// create a server with a connection to NotaDataBase
	mServer = new Server("NotaDataBase.db");
}

// DataBase Server Management
void Client::addTable(const QString& tableName)
{
	auto response = mServer->request_add_table(tableName);
}
