{{- define "jenkins.name" -}}
{{- .Chart.Name }}
{{- end }}

{{- define "jenkins.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride }}
{{- else }}
{{- .Release.Name }}-{{ include "jenkins.name" . }}
{{- end }}
{{- end }}

{{- define "jenkins.labels" -}}
app.kubernetes.io/name: {{ include "jenkins.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "jenkins.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jenkins.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "jenkins.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- .Values.serviceAccount.name | default (include "jenkins.fullname" .) }}
{{- else }}
{{- .Values.serviceAccount.name | default "default" }}
{{- end }}
{{- end }}