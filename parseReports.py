#!/usr/bin/python
# -*- coding: UTF-8 -*-

import sys
import os
import numpy as np

class ReportParser:
    def __init__(self, reportsFolder, outsFolder, reportType):
        self.folder = reportsFolder
        if not self.folder[-1] == "/":
            self.folder += "/"
        self.outFolder = outsFolder
        if not self.outFolder[-1] == "/":
            self.outFolder += "/"
        self.out = open(self.outFolder+"reportsparsed.tex", "w")
        self.type = reportType
        self.rdata = {}

    def Execute(self):
        reports = os.listdir(self.folder)
        self.PrintCommands()
        for report in reports:
            self.CheckReport(report)
        self.AnalyzeReportData()

    def PrintCommands(self):
        importline = "\usepackage{etoolbox}"
        cmd1 = "\\newcommand\\createreportval[3]{\\csdef{rv-#1-#2}{#3}}"
        cmd2  ="\\newcommand\\reportval[2]{\\csuse{rv-#1-#2}}"
        self.out.write(importline + "\n" + cmd1 + "\n" + cmd2 + "\n\n")

    def CheckReport(self, report):
        rName, rType = self.GetReportHeader(report)
        if rType != self.type:  return
        data = self.GetReportData(report)

        showName = rName.replace('.', " (\\textit{") + '})'

        line = "\\createreportval{%s}{%s}{%s}" % (rName, 'name', showName)
        self.out.write(line + "\n")
        
        for attr, value in data.items():
            line = "\\createreportval{%s}{%s}{%s}" % (rName, attr, value)
            self.out.write(line + "\n")

    def GetReportHeader(self, report):
        r = report[:-4]
        parts = r.split("_")
        return ( "_".join(parts[:-1]), parts[-1])

    def SplitReportName(self, rName):
        parts = rName.split(".")
        return ( ".".join(parts[:-1]), parts[-1])
        
    def GetReportData(self, report):
        rep = open(self.folder + report, "r")
        lines = rep.readlines()
        rep.close()
        data = {}
        for line in lines:
            if line.count(":"):
                parts = line.split(":")
                data[parts[0]] = parts[1].strip()

        rFullName, rType = self.GetReportHeader(report)
        rName, rRouter = self.SplitReportName(rFullName)
        if not self.rdata.has_key(rName):
            self.rdata[rName] = {}
        self.rdata[rName][rRouter] = data

        return data

    def AnalyzeReportData(self):
        for rName, dData in self.rdata.items():
            # rName: cenario
            # dData: router -> dados da simulacao
            keys = dData.keys() 
            keys.sort()
            attrKeys = dData[keys[0]].keys()
            attrData = dict([(k, []) for k in attrKeys])
            # attrData: chaveDeAttr da simulacao -> lista de (valor, nomeDoRouter)
            for k in keys:
                values = dData[k]
                for attrK, attrV in values.items():
                    if attrV != "NaN":
                        attrData[attrK].append( (float(attrV), k) )
            tableOut = open(self.outFolder+"table"+rName+".tex", "w")
            tableOut.write( "\\begin{tabular}{c|c c c c}\n" )
            #print rName
            for attrKey, tValues in attrData.items():
                attrKey = attrKey.replace("_", "\\_")
                values = [v[0] for v in tValues]
                if len(values) <= 0:
                    #print "\t%s: all values are NaN" % (attrKey)
                    line = "  %s & NaN & NaN & NaN & NaN \\\\" % (attrKey)
                else:
                    vmin = np.min(values)
                    vmax = np.max(values)
                    minName = tValues[values.index(vmin)][1] #keys[values.index(vmin)]
                    maxName = tValues[values.index(vmax)][1] #keys[values.index(vmax)]
                    avg = np.mean(values)
                    stddev = np.std(values)
                    #print "\t%s: min=(%s, %s), max=(%s, %s), media=(%s), desvio_padrao=(%s)" % (attrKey, vmin, minName, vmax, maxName, avg, stddev)
                    line = "  %s & %s (%s) & %s (%s) & %s & %s \\\\" % (attrKey, vmin, minName, vmax, maxName, avg, stddev)
                tableOut.write(line+"\n")
            tableOut.write( "\\end{tabular}\n" )
            tableOut.close()

    def Close(self):
        self.out.close()


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print "TA ERRADO MANOLO - executa:"
        print "\t./parseReports.py <CaminhoDaPastaDosReports> <CaminhoDaPastaPraSalvarCoisas> [TipoDoReport]"
        print ""
        print "\tTipoDoReport é opcional, e por padrão é 'MessageStatsReport'"
        exit()
    reportsFolder = sys.argv[1]
    outsFolder = sys.argv[2]
    if len(sys.argv) >= 4:
        reportType = sys.argv[3]
    else:
        reportType = "MessageStatsReport"
    parser = ReportParser(reportsFolder, outsFolder, reportType)
    parser.Execute()
    parser.Close()
