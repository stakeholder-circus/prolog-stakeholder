:- initialization(main).

family('code_analyzer', 'classic-six.code_analyzer', 'classic-six', 'analysisFocus', 'predicate-clause-audit').
family('data_processing', 'classic-six.data_processing', 'classic-six', 'dataWindow', 'term-stream-reconciliation').
family('jargon', 'classic-six.jargon', 'classic-six', 'languagePolicy', 'prolog-glossary').
family('metrics', 'classic-six.metrics', 'classic-six', 'signalBlend', 'choicepoint-backtracking-latency').
family('network_activity', 'classic-six.network_activity', 'classic-six', 'transportMix', 'socket-http-sse').
family('system_monitoring', 'classic-six.system_monitoring', 'classic-six', 'telemetryScope', 'gnu-prolog-runtime-host').
family('agent_workflows', 'modern-core.agent_workflows', 'modern-core', 'coordinationMode', 'logic-dispatch-handshake').
family('platform_engineering', 'modern-core.platform_engineering', 'modern-core', 'platformSurface', 'gnu-prolog-native-validation-lane').
family('observability_ai_runtime', 'modern-core.observability_ai_runtime', 'modern-core', 'runtimeSignals', 'logs-metrics-provider-boundary').
family('delivery_preview_ops', 'modern-core.delivery_preview_ops', 'modern-core', 'deliveryGuardrail', 'compiled-preview-checkpoints').
family('supply_chain_security', 'modern-core.supply_chain_security', 'modern-core', 'supplyChainPosture', 'source-binary-attestation').
family('ai_inference_ops', 'fallback.ai_governance', 'fallback-ai_governance', 'fallbackFamily', 'ai_governance').
family('evaluation_and_guardrails', 'fallback.ai_governance', 'fallback-ai_governance', 'fallbackFamily', 'ai_governance').
family('knowledge_retrieval', 'fallback.ai_governance', 'fallback-ai_governance', 'fallbackFamily', 'ai_governance').
family('edge_client_runtime', 'fallback.ai_governance', 'fallback-ai_governance', 'fallbackFamily', 'ai_governance').
family('identity_and_trust', 'fallback.ai_governance', 'fallback-ai_governance', 'fallbackFamily', 'ai_governance').
family('aibom_provenance', 'fallback.ai_governance', 'fallback-ai_governance', 'fallbackFamily', 'ai_governance').
family('agent_boundary_security', 'fallback.ai_governance', 'fallback-ai_governance', 'fallbackFamily', 'ai_governance').
family('embedded_agentic_pipeline', 'fallback.ai_governance', 'fallback-ai_governance', 'fallbackFamily', 'ai_governance').
family('data_governance_compliance', 'fallback.ai_governance', 'fallback-ai_governance', 'fallbackFamily', 'ai_governance').
family('finops_capacity', 'fallback.ai_governance', 'fallback-ai_governance', 'fallbackFamily', 'ai_governance').
family('blockchain_protocol_ops', 'fallback.security_blockchain', 'fallback-security_blockchain', 'fallbackFamily', 'security_blockchain').
family('cross_chain_interop', 'fallback.security_blockchain', 'fallback-security_blockchain', 'fallbackFamily', 'security_blockchain').
family('proof_and_sequencer_ops', 'fallback.security_blockchain', 'fallback-security_blockchain', 'fallbackFamily', 'security_blockchain').
family('hybrid_runtime_ops', 'fallback.overlay_quantum', 'fallback-overlay_quantum', 'fallbackFamily', 'overlay_quantum').
family('capacity_cost_controller', 'fallback.overlay_quantum', 'fallback-overlay_quantum', 'fallbackFamily', 'overlay_quantum').
family('batch_execution_tuner', 'fallback.overlay_quantum', 'fallback-overlay_quantum', 'fallbackFamily', 'overlay_quantum').
family('compiler_maintainer', 'fallback.overlay_quantum', 'fallback-overlay_quantum', 'fallbackFamily', 'overlay_quantum').
family('interop_adapter_engineer', 'fallback.overlay_quantum', 'fallback-overlay_quantum', 'fallbackFamily', 'overlay_quantum').
family('preflight_capacity_planner', 'fallback.overlay_quantum', 'fallback-overlay_quantum', 'fallbackFamily', 'overlay_quantum').
family('simulator_performance_engineer', 'fallback.overlay_quantum', 'fallback-overlay_quantum', 'fallbackFamily', 'overlay_quantum').
family('fhir_profile_generator', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('smart_launch_oauth', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('bulk_fhir_population_ops', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('hl7v2_feed_ops', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('clinical_workflow_events', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('dicomweb_imaging_ops', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('openehr_semantic_record_ops', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('device_telemetry_clinical', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('emr_vendor_adapter', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('ocpp_chargepoint_ops', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('ocpi_roaming_ops', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('mcp_a2a_ops', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('streaming_bus_ops', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').
family('service_mesh_rpc_ops', 'fallback.health_protocol', 'fallback-health_protocol', 'fallbackFamily', 'health_protocol').

normalize_family(In, Out) :- atom_codes(In, Codes), maplist(norm_code, Codes, Norm), atom_codes(Out, Norm).
norm_code(45, 95) :- !.
norm_code(Code, Lower) :- Code >= 65, Code =< 90, !, Lower is Code + 32.
norm_code(Code, Code).
registry_id(Id, Registry) :- atom_codes(Id, Codes), maplist(reg_code, Codes, Out), atom_codes(Registry, Out).
reg_code(95, 45) :- !.
reg_code(Code, Code).

find_family(Input, Id, Renderer, Tranche, ContextKey, ContextValue) :-
    normalize_family(Input, Id),
    family(Id, Renderer, Tranche, ContextKey, ContextValue), !.

family_ids(Ids) :- findall(Id, family(Id, _, _, _, _), Ids).
quoted_ids(Ids) :- write_quoted_ids(Ids).
write_quoted_ids([]).
write_quoted_ids([Id]) :- registry_id(Id, R), write('"'), write(R), write('"').
write_quoted_ids([Id|Rest]) :- registry_id(Id, R), write('"'), write(R), write('",'), write_quoted_ids(Rest).

hash_codes([], Acc, Acc).
hash_codes([Code|Rest], Acc, Hash) :- Next is (Acc * 131 + Code) mod 4294967296, hash_codes(Rest, Next, Hash).
deterministic_hash(Seed, Id, Hash) :- atom_concat(Seed, '::', A), atom_concat(A, Id, Text), atom_codes(Text, Codes), hash_codes(Codes, 2166136261, Hash).
pad2(N) :- N < 10, !, write('0'), write(N).
pad2(N) :- write(N).

print_registry :-
    write('{"outputFormats":["text","json"],'),
    write('"flags":["list-values","focus-family","output-format","seed","experimental-provider"],'),
    write('"generatorFamilies":['),
    findall(Id-Renderer-Tranche, family(Id, Renderer, Tranche, _, _), Rows),
    print_family_rows(Rows),
    write('],"classicSix":['), findall(C, (family(C, _, 'classic-six', _, _)), Classic), quoted_ids(Classic),
    write('],"modernCore":['), findall(M, (family(M, _, 'modern-core', _, _)), Modern), quoted_ids(Modern),
    write('],"fallbackFamilies":['), findall(F, (family(F, _, T, _, _), T \= 'classic-six', T \= 'modern-core'), Fallback), quoted_ids(Fallback),
    write('],"implementationMode":"family-focus-deterministic"}'), nl.

print_family_rows([]).
print_family_rows([Id-Renderer-Tranche]) :- print_family_row(Id, Renderer, Tranche).
print_family_rows([Id-Renderer-Tranche|Rest]) :- print_family_row(Id, Renderer, Tranche), write(','), print_family_rows(Rest).
print_family_row(Id, Renderer, Tranche) :-
    registry_id(Id, Registry),
    write('{"id":"'), write(Id), write('","registryId":"'), write(Registry),
    write('","rendererKey":"'), write(Renderer), write('","tranche":"'), write(Tranche), write('"}').

print_payload(Id, Renderer, Tranche, ContextKey, ContextValue, Seed, json) :-
    deterministic_hash(Seed, Id, Hash),
    Sequence is 1000 + (Hash mod 9000), Seconds is Hash mod 86400,
    Hour is Seconds // 3600, Minute is (Seconds mod 3600) // 60, Second is Seconds mod 60,
    registry_id(Id, Registry),
    write('{"eventType":"stakeholder.generator.output","sequence":'), write(Sequence),
    write(',"family":"'), write(Id),
    write('","message":"Deterministic prolog tranche for '), write(Id),
    write('","timestamp":"2026-01-01T'), pad2(Hour), write(':'), pad2(Minute), write(':'), pad2(Second), write('Z'),
    write('","context":{"rendererKey":"'), write(Renderer),
    write('","'), write(ContextKey), write('":"'), write(ContextValue),
    write('","seedFingerprint":"'), write(Registry), write('-'), write(Hash),
    write('","tranche":"'), write(Tranche),
    write('","prologProfile":"gnu-prolog-compiled-facts"},'),
    write('"generationProvenance":{"sourceRepo":"prolog-stakeholder","baseline":"local-small-tranche-family-focus","experimental":false,"adapterType":"static-fact-catalog","promptVersion":null},"outputFormat":"json"}'), nl.
print_payload(Id, Renderer, Tranche, _, _, Seed, text) :-
    deterministic_hash(Seed, Id, Hash), Sequence is 1000 + (Hash mod 9000), Seconds is Hash mod 86400,
    Hour is Seconds // 3600, Minute is (Seconds mod 3600) // 60, Second is Seconds mod 60,
    write('family: '), write(Id), nl,
    write('renderer: '), write(Renderer), nl,
    write('tranche: '), write(Tranche), nl,
    write('sequence: '), write(Sequence), nl,
    write('timestamp: 2026-01-01T'), pad2(Hour), write(':'), pad2(Minute), write(':'), pad2(Second), write('Z'), nl,
    write('message: Deterministic prolog tranche for '), write(Id), nl.

fail(Message) :- write(user_error, Message), nl(user_error), halt(2).
fail(Message, Value) :- write(user_error, Message), write(user_error, ': '), write(user_error, Value), nl(user_error), halt(2).

parse_args([], Focus, Seed, Format, List) :- run_command(Focus, Seed, Format, List).
parse_args(['--list-values'|Rest], Focus, Seed, Format, _) :- parse_args(Rest, Focus, Seed, Format, yes).
parse_args(['--focus-family', Value|Rest], _, Seed, Format, List) :- parse_args(Rest, Value, Seed, Format, List).
parse_args(['--seed', Value|Rest], Focus, _, Format, List) :- parse_args(Rest, Focus, Value, Format, List).
parse_args(['--output-format', Value|Rest], Focus, Seed, _, List) :-
    (Value = text ; Value = json), !, parse_args(Rest, Focus, Seed, Value, List).
parse_args(['--output-format', Value|_], _, _, _, _) :- fail('invalid --output-format', Value).
parse_args(['--experimental-provider', Value|_], _, _, _, _) :- fail('experimental provider is not enabled in the deterministic first tranche', Value).
parse_args([Arg|_], _, _, _, _) :- atom_concat('--experimental-', _, Arg), !, fail('experimental flags require --experimental-provider').
parse_args([Arg|_], _, _, _, _) :- fail('unknown argument', Arg).

run_command(_, _, _, yes) :- print_registry, halt(0).
run_command(none, _, _, no) :- fail('focus-family is required and must be a known generator family').
run_command(Focus, Seed, Format, no) :-
    (find_family(Focus, Id, Renderer, Tranche, ContextKey, ContextValue)
     -> print_payload(Id, Renderer, Tranche, ContextKey, ContextValue, Seed, Format), halt(0)
     ; fail('invalid --focus-family', Focus)).

main :- current_prolog_flag(argv, Raw), drop_program(Raw, Args), parse_args(Args, none, 'default-seed', text, no).
drop_program([_|Args], Args).
drop_program([], []).
