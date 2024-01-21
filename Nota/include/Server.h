#pragma once

#include <QObject>
#include <QSqlDatabase>
#include <QSqlError>

class Server : public QObject
{
	Q_OBJECT

public:
	explicit Server(const QString& databaseName, QObject* parent = nullptr);

	// DataBase Table Management Requests
	bool request_add_table(const QString& table_name);

private:
	void connectDataBase(const QString& databaseName);

	QSqlDatabase mDataBase;
};
