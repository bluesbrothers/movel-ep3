#!/usr/bin/python

import sys
import os

class ReportParser:
    def __init__(self, reportsFolder, filename, reportType):
        self.folder = reportsFolder
        self.out = open(filename, "w")
        self.type = reportType

    def Execute(self):
        reports = os.listdir(self.folder)
        for report in reports:
            self.CheckReport(report)

    def CheckReport(self, report):
        rName, rType = self.GetReportHeader(report)
        if rType != self.type:  return
        data = self.GetReportData(report)
        
        for attr, value in data.items():
            line = "\createreportval{%s}{%s}{%s}" % (rName, attr, value)
            self.out.write(line + "\n")

    def GetReportHeader(self, report):
        r = report[:-4]
        parts = r.split("_")
        return ( "_".join(parts[:-1]), parts[-1])
        
    def GetReportData(self, report):
        rep = open(self.folder + report, "r")
        lines = rep.readlines()
        rep.close()
        data = {}
        for line in lines:
            if line.count(":"):
                parts = line.split(":")
                data[parts[0]] = parts[1].strip()
        return data

    def Close(self):
        self.out.close()


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print "TA ERRADO MANOLO - executa:"
        print "\t./parseReports.py <CaminhoDaPastaDosReports> <ArquivoPraSalvar> [TipoDoReport]"
        print ""
        print "\tTipoDoReport é opcional, e por padrão é 'MessageStatsReport'"
        exit()
    reportsFolder = sys.argv[1]
    filename = sys.argv[2]
    if len(sys.argv) >= 4:
        reportType = sys.argv[3]
    else:
        reportType = "MessageStatsReport"
    parser = ReportParser(reportsFolder, filename, reportType)
    parser.Execute()
    parser.Close()
