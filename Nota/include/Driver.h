#pragma once

#include "qobject.h"

class Driver : public QObject
{
	Q_OBJECT

public:
	explicit Driver(QObject *parent = nullptr);

	Q_INVOKABLE void printHello();
};
