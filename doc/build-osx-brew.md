Copyright (c) 2012-2013 Suck-a-Coin Developers
Copyright (c) 2009-2012 Bitcoin Developers
Distributed under the MIT software license, see the accompanying file
COPYING or http://www.opensource.org/licenses/mit-license.php. This
product includes software developed by the OpenSSL Project for use in the
OpenSSL Toolkit (https://www.openssl.org/). This product includes cryptographic
software written by Eric Young (eay@cryptsoft.com) and UPnP software written by
Thomas Bernard.


Mac OS X Mountain Lion build instructions
=========================================
How to build Suck-a-Coind and Suck-a-Coin-Qt on 10.8


Prerequisites
=============
Install Xcode from the App Store and launch it

All of the commands should be executed in Terminal.app

1.  Install the Command Line Tools from the Xcode Preferences under Downloads

2.  Install Homebrew from http://brew.sh

3.  Install dependencies from Homebrew

		brew doctor
		brew install boost berkeley-db4 openssl miniupnpc
		brew link berkeley-db4 --force
		brew link openssl --force
		sudo mkdir -p /opt/local/lib
		sudo ln -s /usr/local/lib /opt/local/lib/db48

4.  Clone the github tree to get the source code

		git clone https://github.com/Suck-a-CoinFoundation/Suck-a-Coin.git


Building Suck-a-Coind
=================

1.  Run the makefile

		cd Suck-a-Coin/src/
		make -f makefile.osx RELEASE=true 64BIT=true CXX=g++


Building Suck-a-Coin-Qt.app
=======================
You cannot use Qt 4.8.6 if you want to deploy to other systems
http://qt-project.org/forums/viewthread/41925

1.  Download and install Qt 4.8.5 from

		http://download.qt-project.org/archive/qt/4.8/4.8.5/qt-mac-opensource-4.8.5.dmg

2.  Download and install Qt Creator from

		http://qt-project.org/downloads

3.  Use Qt Creator to build the project

		Double-click Suck-a-Coin/bitcoin-qt.pro to open Qt-Creator
		Click the Configure Project button
		Click on the monitor icon on the left bar above Debug and change it to Release
		On the top menu, click Build and Build Project "bitcoin-qt"


Deploying Suck-a-Coin-Qt.app
========================
Deploying your app is needed to run it on non-development systems

1.  Sym-link some shit

		sudo ln -s /opt/local/lib /opt/local/lib/lib
		sudo ln -s /opt/local/lib/db48/libdb_cxx-4.8.dylib /opt/local/lib/libdb_cxx-4.8.dylib

2.  Copy Suck-a-Coin-Qt.app and run macdeployqt to bundle required libraries

		mkdir deploy
		cp -r build-bitcoin-qt-Desktop-Release/Suck-a-Coin-Qt.app/ deploy/Suck-a-Coin-Qt.app/
		sudo macdeployqt deploy/Suck-a-Coin-Qt.app/

3.  Fix a dependency path

		install_name_tool -change "/opt/local/lib/db48/libdb_cxx-4.8.dylib" "@executable_path/../Frameworks/libdb_cxx-4.8.dylib" deploy/Suck-a-Coin-Qt.app/Contents/MacOS/Suck-a-Coin-Qt

4.  Compress Suck-a-Coin-Qt.app into a zip

		Right-click on Suck-a-Coin-Qt.app and click Compress