#pragma once

#include <QObject>
#include <QSqlDatabase>
#include <QSqlError>

class Driver : public QObject
{
	Q_OBJECT

public:
	explicit Driver(QObject *parent = nullptr);

private:
	void connectDataBase();

	QSqlDatabase mDataBase;
};
