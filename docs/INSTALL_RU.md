# PM Crew — Полная инструкция по запуску и эксплуатации (RU)

Дата: 2025-10-05

## Коротко
- UI/рантайм: Eigent (официальный UI, workers, MCP).
- Артефакты: Spec Kit стиль (constitution + docs).
- Роли/передачи: BMAD.
- Правила: Проверяемость > скорость; не выдумываем API/метрики; соблюдаем лимиты контекста.

## 1) Требования
Node 18+, Git, Python 3.10+. IDE: VS Code / Cursor / Windsurf / Claude Code.

## 2) Установка репозитория `pm-crew`
```bash
cd pm-crew
git init
git add .
git commit -m "feat: bootstrap pm-crew"
git branch -M main
git remote add origin <YOUR_GITHUB_REPO_URL>
git push -u origin main
```

## 3) Клон и запуск Eigent
```bash
git clone https://github.com/eigent-ai/eigent.git
cd eigent
# см. их README для установки/запуска (npm/pnpm/bun)
```

## 4) Подшивка артефактов в Eigent
```bash
# из папки pm-crew
bash scripts/link_into_eigent.sh /absolute/path/to/eigent
```

## 5) MCP-интеграции
Через UI Eigent: GitHub, Jira, Notion, Google, Miro, Figma (секреты — только в окружении Eigent).

## 6) Создание Workers
В UI Eigent для каждого воркера укажи:
- prompt из `custom/pm-crew/prompts`
- schema из `custom/pm-crew/contracts`
- нужные MCP-инструменты

Состав: CPO Strategy, Risk Program (+Legal/Finance/Sec/Ops/Privacy), OKR Planner, Discovery, Program/Project Manager, Roadmap & Delivery, Engineering Manager, Architect, Product Design/Prototyper, Comms/Docs.

## 7) Смоук-тест (чат в Eigent)
```
@CPO Strategy {"portfolio_scope":"Fraud Platform","horizon_months":18,"markets":["EU","US"]}
@Risk Program {"scope":"Fraud Platform EU","domains":["Legal","Security","Finance","Privacy"]}
@OKR Planner {"period":"2026","north_star":"Approved payments (%)","drivers":["approval_rate","fraud_bps","latency_p95"]}
@Discovery {"questions":["Why approval<96% in EU?"],"data_sources":["events","profiles"],"prioritization":"RICE"}
@Program Manager {"target":"MVP EU","deadline":"2026-06-30","cross_teams":["Risk-Platform","Data Platform","SecOps"]}
@Roadmap & Delivery {"milestones":["MVP EU","Feature Store v2"],"export":["Jira","GitHub"]}
@Engineering Manager {"teams":["Risk-Platform","ML-DS"],"capacity_weeks":12}
@Architect {"system_type":"ML","non_functionals":["p95<=120ms","AUC>=0.9"],"constraints":["PCI","GDPR"]}
@Product Design / Prototyper {"prototype_goal":"Dispute workflow UI","tools":["Figma","Miro"]}
```

## 8) Редактирование и перенос правок
```bash
git pull
# edit prompts/* or agents/contracts/*
git add -A && git commit -m "chore: tweak PM Crew assets" && git push
bash scripts/link_into_eigent.sh /absolute/path/to/eigent
```

## 9) Новые документы
```bash
cp docs/adr/_template.md docs/adr/2026-01-adr-<kebab>.md
cp docs/rfc/_template.md docs/rfc/2026-01-rfc-<kebab>.md
cp docs/design/_template.md docs/design/2026-01-design-<kebab>.md
```
Пустые PRD: docs/prd/anti-fraud.md, docs/prd/cdp.md, docs/prd/loyalty-aggregators.md.
Discovery пример: discovery/hypotheses.csv.

## 10) Новый агент
```bash
bash scripts/new_agent.sh MyNewWorker
# редактируй agents/contracts/MyNewWorker.json и prompts/MyNewWorker.md
bash scripts/link_into_eigent.sh /absolute/path/to/eigent
```

## 11) Прод
Grounding в PRD/ADR/Spec; токен-бюджеты; трейс/стоимость/latency/качество; безопасность (OWASP GenAI/NIST AI RMF).

## 12) Рекомендации
Если захочешь — добавлю **черновики PRFAQ/6-pager** и подготовлю **initial ADR** для Anti-Fraud/CDP/Loyalty под твои вводные.
